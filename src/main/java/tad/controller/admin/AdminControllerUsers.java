package tad.controller.admin;

import java.io.File;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Role;
import tad.utility.Constants;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/admin/user")
public class AdminControllerUsers {
	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile accountImgDir;

	@RequestMapping()
	public String index() {
		return "redirect:get-employee.htm";
	}

	@RequestMapping("get-guest")
	public String gUserListGuest(ModelMap modelMap,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRoleID.GUEST);

		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (accounts.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = accounts.size() / Constants.USER_PER_PAGE;
			if (accounts.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("accounts",
				accounts.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, accounts.size())));
		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("source", "get-guest.htm");

		return "admin/admin-guest";
	}

	@RequestMapping("get-employee")
	public String gUserListEmployee(ModelMap modelMap,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRoleID.EMPLOYEE);

		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (accounts.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = accounts.size() / Constants.USER_PER_PAGE;
			if (accounts.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}
		modelMap.addAttribute("accounts",
				accounts.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, accounts.size())));
		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("source", "get-employee.htm");
		return "admin/admin-employee";
	}

	@RequestMapping(value = "enable{id}")
	public String gEnableStatusUser(@PathVariable("id") int id, ModelMap modelMap,
			@RequestParam("source") String source) {

		Account acc = accountDAO.getAccount(id);
		if (acc != null) {
			System.out.println(acc.getStatus());
			if (acc.getStatus() == 1)
				acc.setStatus(0);
			else if (acc.getStatus() == 0)
				acc.setStatus(1);
			accountDAO.updateAccount(acc);
		}

		return "redirect:" + source;
	}

	@RequestMapping(value = "create-employee", method = RequestMethod.GET)
	public String registerEmployee(ModelMap modelMap) {
		UserBean accEmploy = new UserBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, accEmploy);
		return "admin/admin-register-employee";
	}

	@RequestMapping(value = "create-employee", method = RequestMethod.POST)
	public String createEmployee(@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, RedirectAttributes reAttributes, ModelMap modelMap) {
		Role role = accountDAO.getRoleViaEnum(EnumRoleID.EMPLOYEE);
		Account account = null;
		if (!errors.hasErrors()) {
			if (user.getAvatar().isEmpty()) {
			} else {
				File file = new File(accountImgDir.getPath() + user.getAvatar());
				if (file.exists())
					file.delete();

				String avatarPath = accountImgDir.getPath() + user.getAvatar();

				try {
					user.getAvatar().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					modelMap.addAttribute("alert", 3);
					modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
					return "admin/admin-edit-user";
				}
			}
			account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(), user.getPhoneNumber(),
					user.getAvatar().getOriginalFilename(), BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
			if (!user.getAvatarDir().isEmpty()) {
				account.setAvatar(user.getAvatarDir());
			}

			if (accountDAO.findAccountByEmail(user.getEmail()) != null) {
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
				modelMap.addAttribute("alert", 1);
				return "admin/admin-register-employee";
			}

			if (accountDAO.addAccountToDB(account)) {
				reAttributes.addFlashAttribute("alert", 2);
				return "redirect:create-employee.htm";

			}
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "admin/admin-register-employee";
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String editEmployee(ModelMap modelMap, @RequestParam("id") int id) {
		Account account = accountDAO.getAccount(id);
		UserBean userBean = new UserBean(account.getEmail(), account.getFirstName(), account.getLastName(),
				account.getPhoneNumber(), account.getAvatar());
		userBean.setPassword("***************");
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, userBean);
		modelMap.addAttribute("id", id);
		return "admin/admin-edit-user";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String editEmployee(ModelMap modelMap,
			@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user, BindingResult errors,
			ModelMap model, @RequestParam("id") int id) {

		if (errors.hasErrors()) {
			modelMap.addAttribute("alert", 1);
			return "admin/admin-edit-user";
		}
		Account account = accountDAO.getAccount(id);
		account.setLastName(user.getLastName());
		account.setFirstName(user.getFirstName());
		account.setPhoneNumber(user.getPhoneNumber());
		account.setEmail(user.getEmail());
		if (user.getAvatar().isEmpty()) {
		} else {
			File file = new File(accountImgDir.getPath() + user.getAvatar());
			if (file.exists())
				file.delete();

			String avatarPath = accountImgDir.getPath() + user.getAvatar();
			account.setAvatar(user.getAvatar().getOriginalFilename());
			try {
				user.getAvatar().transferTo(new File(avatarPath));
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				modelMap.addAttribute("alert", 3);
				model.addAttribute(DefineAttribute.UserBeanAttribute, user);
				return "admin/admin-edit-user";
			}
		}

		if (accountDAO.updateAccount(account)) {
			if (account.getRole().getRoleName().equals("Guest"))
				return "redirect:get-guest.htm";
			else
				return "redirect:get-employee.htm";

		}

		modelMap.addAttribute("alert", 1);
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "admin/admin-edit-user";
	}

	@RequestMapping(value = "create-guest", method = RequestMethod.GET)
	public String registerGuest(ModelMap modelMap) {
		UserBean accEmploy = new UserBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, accEmploy);
		return "admin/admin-register-guest";
	}

	@RequestMapping(value = "create-guest", method = RequestMethod.POST)
	public String createGuest(ModelMap model,
			@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user, BindingResult errors,
			RedirectAttributes reAttributes, ModelMap modelMap) {
		Role role = accountDAO.getRoleViaEnum(EnumRoleID.GUEST);
		Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(),
				user.getPhoneNumber(), "", BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		if (!errors.hasErrors()) {
			if (!user.getAvatar().isEmpty()) {
				File file = new File(accountImgDir.getPath() + user.getAvatar());
				if (file.exists())
					file.delete();

				String avatarPath = accountImgDir.getPath() + user.getAvatar();
				account.setAvatar(user.getAvatar().getOriginalFilename());

				try {
					user.getAvatar().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 2);
					return "account/accountProfile";
				}
			}

			if (!user.getAvatarDir().isEmpty()) {
				account.setAvatar(user.getAvatarDir());
			}

			if (accountDAO.findAccountByEmail(user.getEmail()) != null) {
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
				modelMap.addAttribute("alert", 1);
				return "admin/admin-register-guest";
			}

			if (accountDAO.addAccountToDB(account)) {
				reAttributes.addFlashAttribute("alert", 2);
				return "redirect:create-guest.htm";

			}
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "admin/admin-register-guest";
	}
}
