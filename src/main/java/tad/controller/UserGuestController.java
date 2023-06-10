package tad.controller;

import java.io.File;
import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.bean.LoginBean;
import tad.bean.MyMailer;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Role;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/guest")
public class UserGuestController {
	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile rootFile;

	@Autowired
	private IAccountDAO accountDAO;

	public Cookie read(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					String decodedvalue = new String(Base64.getDecoder().decode(cookie.getValue()));
					cookie.setValue(decodedvalue);
					return cookie;
				}
			}
		}
		return null;
	}

	public Cookie create(String name, String value, int days) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60);
		cookie.setPath("/");
		return cookie;

	}

	public void delete(String name) {
		this.create(name, "", 0);
	}

	@RequestMapping()
	public String index(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
		LoginBean emptyLogin = new LoginBean();
		Cookie ckemail = this.read(request, "email");
		Cookie ckpw = this.read(request, "pass");
		if (ckemail != null) {
			String email = ckemail.getValue();
			String pwd = ckpw.getValue();

			emptyLogin.setUsername(email);
			emptyLogin.setPassword(pwd);
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, emptyLogin);
		return "user/user-login";
	}

	@RequestMapping(params = "guest-login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") LoginBean user, ModelMap modelMap, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) {
		Account ValidateUser = accountDAO.findAccountByEmail(user.getUsername());

		if (ValidateUser != null && ValidateUser.getStatus() != 0
				&& BCrypt.checkpw(user.getPassword(), ValidateUser.getPassword())) {

			// Tai khoan bi khoa ko dang nhap
			if (ValidateUser.getStatus() == 0) {
				modelMap.addAttribute("alert", 6);
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
				return "user/user-login";
			}

			// Ghi nho tai khoan bang cookie
			if (user.getIsRemember()) {
				Cookie ckemail = this.create("email", ValidateUser.getEmail(), 30);
				Cookie ckpass = this.create("pass", user.getPassword(), 30);

				response.addCookie(ckemail);
				response.addCookie(ckpass);

			} else {
				this.delete("email");
				this.delete("pass");
			}

			session.setAttribute(DefineAttribute.UserAttribute, ValidateUser);
			session.setAttribute("account", ValidateUser);
			return "redirect:/index.htm";
		}

		modelMap.addAttribute("alert", 1);
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "user/user-login";
	}

	@RequestMapping(value = "guest-register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		UserBean user = new UserBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "user/user-register";
	}

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile accountDir;

	@RequestMapping(value = "guest-register", method = RequestMethod.POST)
	public String register(ModelMap model, @Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, ModelMap modelMap, RedirectAttributes reAttributes) {
		Role role = accountDAO.getRoleViaEnum(EnumRoleID.GUEST);
		Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(),
				user.getPhoneNumber(), "", BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		if (!errors.hasErrors()) {

			if (!user.getAvatar().isEmpty()) {
				File file = new File(rootFile.getPath() + user.getAvatar());
				if (file.exists())
					file.delete();

				String avatarPath = accountDir.getPath() + user.getAvatar();
				account.setAvatar(user.getAvatar().getOriginalFilename());

				try {
					user.getAvatar().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 2);
					return "user/user-register";
				}
			}

			if (accountDAO.findAccountByEmail(user.getEmail()) != null) {
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
				modelMap.addAttribute("alert", 1);
				return "user/user-register";
			}

			if (accountDAO.addAccountToDB(account)) {

				reAttributes.addFlashAttribute("alert", 2);
				return "redirect:/guest/guest-register.htm";
			}
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "user/user-register";
	}

	@RequestMapping("logout")
	public String logout(ModelMap model, HttpSession session) {
		Account crrAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (crrAcc != null)
			session.removeAttribute(DefineAttribute.UserAttribute);
		return "redirect:/";
	}

	@Autowired
	MyMailer mailer;

	@RequestMapping(value = "resend-password", method = RequestMethod.POST)
	public String resendPassword(@RequestParam("email") String email, RedirectAttributes reAttributes, ModelMap model,
			HttpServletRequest request) {
		// Captcha Handler
		HttpSession session = request.getSession();
		String sessionCaptcha = (String) session.getAttribute("captcha");

		// Get the user-entered captcha value from the form
		String userCaptcha = request.getParameter("captcha");
		Account acc = accountDAO.findAccountByEmail(email);
		// Compare the user-entered captcha with the one stored in session
		if (sessionCaptcha.equalsIgnoreCase(userCaptcha) && acc != null) {

			// Email Handler
			String from = "TadGarden";
			String to = email;
			String subject = "Reset password";

			String htmlContent = "Click the link below:"
					+ "http://localhost:9999/Web_Nong_San/guest/userrequest.htm?email=" + email + "&ecypt="
					+ acc.getPassword() + "";

			String body = "Click at this link to change the password: ";
			try {
				mailer.send(from, to, subject, body + htmlContent);
				reAttributes.addFlashAttribute("alert", 2);
			} catch (Exception ex) {
				System.out.println(ex);
				reAttributes.addFlashAttribute("alert", 3);
			}

			return "redirect:/guest.htm";

		} else {
			reAttributes.addFlashAttribute("alert", 4);
			return "redirect:/guest.htm";
		}

	}

	@RequestMapping(value = "userrequest", method = RequestMethod.GET)
	private String gResetPassword(@RequestParam("email") String email, @RequestParam("ecypt") String pwwencyt,
			ModelMap model) {
		Account accUser = accountDAO.findAccountByEmail(email);
		if (accUser != null && accUser.getPassword().compareTo(pwwencyt) == 0) {
			model.addAttribute("email", accUser.getEmail());

			return "user/reset-password";
		}
		return "redirect:/guest.htm";
	}

	@RequestMapping(value = "userrequest", method = RequestMethod.POST)
	private String pResetPassword(@RequestParam("email") String email, @RequestParam("password") String pw,
			@RequestParam("confirm-passsword") String cppw, RedirectAttributes reAttributes, ModelMap model,
			@RequestParam("oldPath") String oldPath, HttpServletRequest request) {
		Account accUser = accountDAO.findAccountByEmail(email);

		if (accUser != null && pw.compareTo(cppw) == 0) {
			accUser.setPassword(BCrypt.hashpw(pw, BCrypt.gensalt(12)));
			accountDAO.updateAccount(accUser);
			reAttributes.addFlashAttribute("alert", 5);
			return "redirect:/guest.htm";
		}
		// System.out.println(referringURL);
		return "redirect:" + oldPath;
	}
}
