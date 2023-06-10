package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICartDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.IProductDAO;
import tad.DAO.IWishlistDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.Category;
import tad.entity.Product;
import tad.entity.Wishlist;
import tad.utility.Constants;
import tad.utility.DefineAttribute;

@Controller
public class UserHomeController {
	@Autowired
	private Company company;
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	@Autowired
	private IWishlistDAO wishlistDAO;
	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap, HttpSession session) {

		Account account = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		int totalCart = 0;
		int totalWishlist = 0;

		List<Category> category = categoryDAO.getListCategoriesHasProduct();
		List<Product> productsWithCoupon = productDAO.listProductsWithCoupon();
		List<Product> newProducts = productDAO.listNewProducts();
		List<Product> bestseller = productDAO.listBestSellerProducts();

		if (account != null) {
			List<Cart> list = cartDAO.getCart(account.getAccountId());
			List<Wishlist> wishlist = wishlistDAO.getWishlist(account.getAccountId());

			totalCart = list.size();
			totalWishlist = wishlist.size();
		}

		for (int i = 0; i < category.size(); i++) {
			Category fCategory = categoryDAO.fetchCategory(category.get(i));
			category.set(i, fCategory);
		}

		session.setAttribute("company", company);
		session.setAttribute("category", category);
		session.setAttribute("totalCart", totalCart);
		session.setAttribute("totalWishlist", totalWishlist);
		session.setAttribute("firstCategory", category.get(0).getCategoryId());

		modelMap.addAttribute("productsWithCoupon",
				productsWithCoupon.subList(0, Math.min(Constants.PRODUCT_PER_PAGE_IN_HOME, productsWithCoupon.size())));
		modelMap.addAttribute("newProducts",
				newProducts.subList(0, Math.min(Constants.PRODUCT_PER_PAGE_IN_HOME, newProducts.size())));
		modelMap.addAttribute("bestseller",
				bestseller.subList(0, Math.min(Constants.PRODUCT_PER_PAGE_IN_HOME, bestseller.size())));
		return "page/home";
	}

	@RequestMapping("aboutUs")
	public String aboutUs() {
		return "page/aboutUs";

	}

	@RequestMapping("contactUs")
	public String contactUs() {
		return "page/contactUs";

	}

	@RequestMapping("searchFood")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "currentPage", defaultValue = "1") int currentPage,
			ModelMap modelMap) {

		List<Product> products = productDAO.filterProductByName(search);

		int startIndex = (currentPage - 1) * Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE_IN_CATEGORY)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
			if (products.size() % Constants.PRODUCT_PER_PAGE_IN_CATEGORY != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_CATEGORY, products.size())));
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("total", products.size());

		return "search/index";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute(DefineAttribute.UserAttribute);
		session.setAttribute("totalCart", 0);
		session.setAttribute("totalWishlist", 0);
		return "redirect:/guest/logout.htm";
	}

}
