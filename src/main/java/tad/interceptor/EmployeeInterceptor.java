package tad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tad.DAO.IAccountDAO.EnumRoleID;
import tad.entity.Account;
import tad.utility.DefineAttribute;

public class EmployeeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc != null && acc.getRole().getRoleId().equals(EnumRoleID.EMPLOYEE.toString())) {
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/index.htm");
		return false;

	}
}
