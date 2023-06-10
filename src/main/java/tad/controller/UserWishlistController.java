package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.DAO.IWishlistDAO;
import tad.entity.Account;
import tad.entity.Wishlist;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/wishlist/")

public class UserWishlistController {

	@Autowired
	private IWishlistDAO wishlistDAO;

	// Trả về ds giỏ hàng
	@RequestMapping(value = "index")
	public String cart(ModelMap model, HttpSession session) {

		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (account == null) {
			return "redirect:/guest.htm";
		}
		List<Wishlist> list = wishlistDAO.getWishlist(account.getAccountId());
		model.addAttribute("wishlists", list);

		return "wishlist/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (account == null) {
			return "redirect:/guest.htm";
		}
		wishlistDAO.deleteWishlist(wishlistDAO.getWishlist(account.getAccountId(), Integer.parseInt(productID)));
		List<Wishlist> list = wishlistDAO.getWishlist(account.getAccountId());
		model.addAttribute("wishlists", list);
		int totalWishlist = (int) session.getAttribute("totalWishlist");
		if (totalWishlist > 0)
			session.setAttribute("totalWishlist", totalWishlist - 1);

		return "redirect:/wishlist/index.htm";
	}

}
