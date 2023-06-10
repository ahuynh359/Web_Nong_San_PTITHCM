package tad.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.DAO.IOrderDAO;
import tad.entity.Account;
import tad.entity.Orders;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminControllerDashboard {
	@Autowired
	private IOrderDAO orderDAO;

	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping()
	public String index(ModelMap model) {

		double totalOrder = 0;
		List<Orders> orders = orderDAO.getOrders();
		for (Orders o : orders) {
			if (o.getStatus() == 2)
				totalOrder += o.getPrice();
		}

		// Role role = accountDAO.getRoleViaEnum(EnumRoleID.GUEST);
		List<Account> client = accountDAO.listAccountWithRole(EnumRoleID.GUEST);
		// client = client.stream().filter(rate ->
		// rate.getRole().equals(role)).collect(Collectors.toList());

		model.addAttribute("totalOrder", orders.size());
		model.addAttribute("totalEarning", totalOrder);
		model.addAttribute("totalClient", client.size());

		return "admin/admin-dashboard";

	}

}
