package tad.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IOrderDAO;
import tad.entity.OrderDetail;
import tad.entity.Orders;
import tad.utility.Constants;

@Controller
@RequestMapping("/admin/orders")
public class AdminControllerOrders {

	@Autowired
	private IOrderDAO orderDAO;

	@RequestMapping()
	public String index(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage,
			@RequestParam(value = "filter", required = false, defaultValue = "0") int filter) {
		List<Orders> orders = null;
		if (filter == 0) {
			orders = orderDAO.getOrders();
		} else if (filter == 1) {
			orders = orderDAO.getMovingOrders();
		} else if (filter == 2) {
			orders = orderDAO.getUnresolveOrders();
		} else if (filter == 3) {
			orders = orderDAO.getUnresolveOrders();
		} else if (filter == 4) {
			orders = orderDAO.getCancelOrders();

		}

		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (orders.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = orders.size() / Constants.USER_PER_PAGE;
			if (orders.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("crrPage", crrPage);
		List<Orders> list = orders.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, orders.size()));
		model.addAttribute("order", list);
		model.addAttribute("filter", filter);
		return "admin/admin-orders";
	}

	@RequestMapping(value = "update-order")
	public String updateOrder(@RequestParam("id") int id, @RequestParam("status") String status) {
		Orders order = orderDAO.findOrder(id);

		if (order != null) {
			short shortValue = Short.parseShort(status);
			order.setStatus(shortValue);
			orderDAO.update(order);

		}
		return "redirect:/admin/orders.htm";
	}

	@RequestMapping(value = "order-detail")
	public String orderDetail(@RequestParam("orderId") int orderId, ModelMap model) {
		Orders order = orderDAO.findOrder(orderId);
		List<OrderDetail> orderDetail = orderDAO.getOrderDetail(orderId);

		model.addAttribute("order", order);
		model.addAttribute("orderDetail", orderDetail);

		return "admin/admin-order-detail";
	}

}
