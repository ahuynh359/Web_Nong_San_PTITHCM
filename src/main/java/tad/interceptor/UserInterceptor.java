package tad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.entity.Account;
import tad.utility.DefineAttribute;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	IAccountDAO accountDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/guest.htm"); // guest.htm
			return false;
		} else if (user.getRole().getRoleId().equals(EnumRoleID.GUEST.toString())) {
			return true;
		}

		response.sendRedirect(request.getContextPath() + "/guest.htm");
		return false;
	}
}
