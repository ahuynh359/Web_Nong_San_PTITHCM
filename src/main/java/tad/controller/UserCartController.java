package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICartDAO;
import tad.entity.Account;
import tad.entity.Cart;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/cart")

public class UserCartController {

	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping(value = "index")
	public String cart(ModelMap modelMap, HttpSession session) {

		float subtotal = 0;
		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (account == null) {
			return "redirect:/guest.htm";
		}
		List<Cart> list = cartDAO.getCart(account.getAccountId());

		int canCheckOut = 1;

		if (list != null) {
			for (Cart c : list) {
				// Chi tinh nhung sp con hang
				if (c.getProduct().getQuantity() > 0) {
					if (c.getProduct().getCoupon() != null && c.getProduct().getCoupon().checkVaildCoupon())
						subtotal += c.getQuantity() * (c.getProduct().getPrice()
								- (c.getProduct().getPrice() * c.getProduct().getCoupon().getDiscount()));
					else if (c.getProduct().getCoupon() == null || (!c.getProduct().getCoupon().checkVaildCoupon()))
						subtotal += c.getQuantity() * c.getProduct().getPrice();

				}

			}

			for (Cart c : list) {
				if (c.getProduct().getQuantity() == 0) {
					canCheckOut = 0;
					break;
				}
			}

		}

		modelMap.addAttribute("defaultAddress", account.getDefaultAddress());
		modelMap.addAttribute("carts", list);
		modelMap.addAttribute("subtotal", subtotal);
		modelMap.addAttribute("canCheckOut", canCheckOut);

		return "cart/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (account == null) {
			return "redirect:/guest.htm";
		}
		cartDAO.deleteCart(cartDAO.getCart(account.getAccountId(), Integer.parseInt(productID)));
		List<Cart> list = cartDAO.getCart(account.getAccountId());
		model.addAttribute("carts", list);
		int totalCart = (int) session.getAttribute("totalCart");
		if (totalCart > 0)
			session.setAttribute("totalCart", totalCart - 1);
		return "redirect:/cart/index.htm";
	}

	@RequestMapping(value = "quantity/plus", params = { "productID", "quantity" })
	public String qtyPlus(ModelMap model, HttpSession session, @RequestParam("productID") int id,
			@RequestParam("quantity") int qty) {
		cartDAO.updateQuantity(id, qty + 1);

		return "redirect:/cart/index.htm";
	}

	@RequestMapping(value = "quantity/minus", params = { "productID", "quantity" })
	public String qtyMinus(ModelMap model, @RequestParam("productID") int id, HttpSession session,
			@RequestParam("quantity") int qty) {
		cartDAO.updateQuantity(id, qty - 1);

		return "redirect:/cart/index.htm";
	}

}
