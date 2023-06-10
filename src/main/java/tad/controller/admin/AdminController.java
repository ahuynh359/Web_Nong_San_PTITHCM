package tad.controller.admin;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAccountDAO;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile accountImgDir;

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/admin/dashboard.htm";
	}

	@RequestMapping("profile")
	public String gInfo(ModelMap model, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/guest.htm";
		}

		UserBean userBean = new UserBean(acc.getEmail(), acc.getFirstName(), acc.getLastName(), acc.getPhoneNumber());
		userBean.setPassword("***************");
		model.addAttribute(DefineAttribute.UserBeanAttribute, userBean);
		return "admin/admin-profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String pInfo(@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, HttpSession session, ModelMap modelMap) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/guest.htm";
		}

		if (errors.hasErrors()) {
			modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
			modelMap.addAttribute("message", false);
			return "admin/admin-profile";
		}
		acc.setLastName(user.getLastName());
		acc.setFirstName(user.getFirstName());
		acc.setPhoneNumber(user.getPhoneNumber());
		acc.setEmail(user.getEmail());

		File file = new File(accountImgDir.getPath() + user.getAvatar());
		if (file.exists())
			file.delete();

		String avatarPath = accountImgDir.getPath() + user.getAvatar();
		acc.setAvatar(user.getAvatar().getOriginalFilename());

		try {
			user.getAvatar().transferTo(new File(avatarPath));
			Thread.sleep(2000);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.addAttribute("message", false);
			modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
			return "admin/admin-category-form";
		}

		accountDAO.updateAccount(acc);

		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		modelMap.addAttribute("message", true);
		return "admin/admin-profile";
	}

	@RequestMapping("logout")
	public String logout(ModelMap model, HttpSession session) {
		session.removeAttribute(DefineAttribute.UserAttribute);
		session.setAttribute("totalCart", 0);
		session.setAttribute("totalWishlist", 0);
		return "redirect:/guest/logout.htm";
	}

}
