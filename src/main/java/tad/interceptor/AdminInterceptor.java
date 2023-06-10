package tad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tad.DAO.IAccountDAO.EnumRoleID;
import tad.entity.Account;
import tad.utility.DefineAttribute;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute(DefineAttribute.UserAttribute);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/guest.htm"); // guest.htm
			return false;
		} else if (user.getRole().getRoleId().equals(EnumRoleID.ADMIN.toString())) {
			return true;
		}
		session.removeAttribute(DefineAttribute.UserAttribute);
		response.sendRedirect(request.getContextPath() + "/");
		return false;
	}

}
