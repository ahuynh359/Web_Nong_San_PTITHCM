package tad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tad.DAO.IAccountDAO;
import tad.entity.Account;
import tad.utility.DefineAttribute;

public class GlobalInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private IAccountDAO accountDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		// If there is user try to add information of user
		if (user != null) {
			Account acc = accountDAO.findAccountByEmail(user.getEmail());
			if (acc != null) {
				request.setAttribute(DefineAttribute.UserAttribute, acc);
			}
		}
		return true;
	}

}
