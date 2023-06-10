package tad.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.DAO.ICartDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.IFeedbackDAO;
import tad.DAO.IProductDAO;
import tad.DAO.IWishlistDAO;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.CartId;
import tad.entity.Feedback;
import tad.entity.Product;
import tad.entity.Wishlist;
import tad.entity.WishlistId;
import tad.utility.Constants;
import tad.utility.DefineAttribute;
import tad.utility.Ultis;

@Controller
@RequestMapping("/product")
public class UserProductController {

	@Autowired
	private IProductDAO productDAO;

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	private ICartDAO cartDAO;

	@Autowired
	private IWishlistDAO wishlistDAO;

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IFeedbackDAO feedbackDAO;

	@RequestMapping(value = "index")
	public String index(ModelMap modelMap, @RequestParam(value = "categoryId", required = false) int categoryId,
			@RequestParam(value = "index", required = false, defaultValue = "0") int index,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "filterPrice", required = false, defaultValue = "0") int filterPrice) {

		List<Product> productsFilterWithCategory = productDAO.listProductsInCategory(categoryId);
		Ultis.filterProductByIndex(index, productsFilterWithCategory);
		productsFilterWithCategory = Ultis.filterProductByPrice(filterPrice, productsFilterWithCategory);

		int startIndex = (currentPage - 1) * Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
		int totalPage = 1;
		if (productsFilterWithCategory.size() <= Constants.PRODUCT_PER_PAGE_IN_CATEGORY)
			totalPage = 1;
		else {
			totalPage = productsFilterWithCategory.size() / Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
			if (productsFilterWithCategory.size() % Constants.PRODUCT_PER_PAGE_IN_CATEGORY != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("productsFilterWithCategory", productsFilterWithCategory.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_CATEGORY, productsFilterWithCategory.size())));

		modelMap.addAttribute("index", index);
		modelMap.addAttribute("currentCategory", categoryDAO.getCategory(categoryId));
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalSize", productsFilterWithCategory.size());
		modelMap.addAttribute("filterPrice", filterPrice);
		return "product/index";
	}

	@RequestMapping(value = "addToCart", params = { "productId" })
	public String addToCart(ModelMap model, RedirectAttributes reAttributes, HttpServletRequest request,
			HttpSession session, @RequestParam("productId") int productID) {

		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);

		if (account == null) {
			return "redirect:/guest.htm";
		} else {

			Cart cart = cartDAO.getCart(account.getAccountId(), productID);
			account = accountDAO.getAccount(account.getAccountId());
			if (cart != null) {
				if (cart.getQuantity() < cart.getProduct().getQuantity()) {
					cart.setQuantity(cart.getQuantity() + 1);
					cartDAO.updateCart(cart);
				}

			} else {
				cart = new Cart();
				cart.setId(new CartId(productID, account.getAccountId()));
				cart.setAccount(account);
				cart.setProduct(productDAO.getProduct(productID));
				cart.setQuantity(1);
				cartDAO.insertCart(cart);
				int totalCart = (int) session.getAttribute("totalCart");
				session.setAttribute("totalCart", totalCart + 1);
			}

			reAttributes.addFlashAttribute("alert", 1);
		}

		return "redirect:" + request.getHeader("Referer");

	}

	@RequestMapping(value = "addToWishlist", params = { "productId" })
	public String addToWishlist(ModelMap model, RedirectAttributes reAttributes, HttpServletRequest request,
			HttpSession session, @RequestParam("productId") int productID) {

		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);

		if (account == null) {
			return "redirect:/guest.htm";
		} else {

			Wishlist wishlist = wishlistDAO.getWishlist(account.getAccountId(), productID);
			account = accountDAO.getAccount(account.getAccountId());
			if (wishlist != null) {

			} else {
				wishlist = new Wishlist();
				wishlist.setId(new WishlistId(productID, account.getAccountId()));
				wishlist.setAccount(account);
				wishlist.setProduct(productDAO.getProduct(productID));
				wishlistDAO.insertWishlist(wishlist);
				int totalWishlist = (int) session.getAttribute("totalWishlist");
				session.setAttribute("totalWishlist", totalWishlist + 1);
			}
			reAttributes.addFlashAttribute("alert", 2);

		}

		return "redirect:" + request.getHeader("Referer");

	}

	@RequestMapping(value = "detail", params = { "productId" })
	public String detail(ModelMap modelMap, @RequestParam("productId") int productId,
			@RequestParam(value = "filterStar", required = false, defaultValue = "0") int filterStar,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {


		Product product = productDAO.getProduct(productId);
		modelMap.addAttribute("product", product);

		// 5 sao co bnhiu danh gia, 4 sao co bnhiu danh gia ,...
		List<Feedback> feedbacks = feedbackDAO.listFeedback(productId);
		int[] countStar = new int[6];
		for (int i = 1; i < 6; i++) {
			countStar[i] = 0;
		}
		for (Feedback f : feedbacks) {
			countStar[f.getRatingStar()]++;
		}

		List<Feedback> rateds = feedbackDAO.listByStars(productId, filterStar);

		//Hien thi so sao cua san pham
		double avgStar = Ultis.getAvgStar(product);

		//Loc ra cac san pham cung loại
		List<Product> listProductSameCategory = productDAO
				.listProductsInCategory(product.getCategory().getCategoryId());
		Collections.shuffle(listProductSameCategory);

		listProductSameCategory = listProductSameCategory.subList(0, Math.min(5, listProductSameCategory.size()));

		int startIndex = (currentPage - 1) * Constants.COMMENT_PER_PAGE;
		int totalPage = 1;
		if (rateds.size() <= Constants.COMMENT_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = rateds.size() / Constants.COMMENT_PER_PAGE;
			if (rateds.size() % Constants.COMMENT_PER_PAGE != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("avgStar", avgStar);
		modelMap.addAttribute("countStar", countStar);
		modelMap.addAttribute("feedbacks", feedbacks);
		modelMap.addAttribute("listProductSameCategory", listProductSameCategory);
		modelMap.addAttribute("rateds",
				rateds.subList(startIndex, Math.min(startIndex + Constants.COMMENT_PER_PAGE, rateds.size())));
		modelMap.addAttribute("currentCategoryId", product.getCategory().getCategoryId());

		modelMap.addAttribute("filterStar", filterStar);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("currentProductId", productId);
		return "product/detail";
	}

}
