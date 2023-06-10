package tad.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICategoryDAO;
import tad.DAO.ICouponDAO;
import tad.DAO.IProductDAO;
import tad.bean.ProductBean;
import tad.bean.UploadFile;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Coupon;
import tad.entity.Product;
import tad.utility.Constants;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/admin/products")
public class AdminControllerProduct {

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IProductDAO productDAO;

	@Autowired
	@Qualifier("productImgDir")
	private UploadFile productImgDir;

	@Autowired
	private ICouponDAO couponDAO;

	@RequestMapping()
	public String gProductList(ModelMap model, HttpSession session,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {

		List<ProductBean> products = new ArrayList<>();
		List<Product> listProducts = productDAO.listProducts();
		for (Product product : listProducts) {
			ProductBean bean = new ProductBean(product);
			products.add(bean);
		}

		int startIndex = (crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE_IN_HOME)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
			if (products.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
				totalPage++;
			}
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("crrPage", crrPage);
		model.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, products.size())));
		return "admin/admin-product";
	}

	@RequestMapping(value = "update-product{id}.htm", method = RequestMethod.POST)
	public String pUpdateProduct(ModelMap model, @PathVariable("id") int id,
			@ModelAttribute("productForm") ProductBean product) {
		Product findProduct = productDAO.getProduct(id);

		if (findProduct != null) {
			// 1
			Category category = categoryDAO.getCategory(product.getCategoryId());
			if (category != null) {
				findProduct.setCategory(category);
			}

			// 2
			if (product.getDiscountId() != -1) {
				Coupon coupon = couponDAO.getCoupon(product.getDiscountId());
				if (coupon != null) {
					findProduct.setCoupon(coupon);
				}
			}

			// 3
			if (product.getImageFile() != null) {
				File file = new File(productImgDir.getPath() + product.getImageFile());
				if (file.exists())
					file.delete();

				String avatarPath = productImgDir.getPath() + product.getImageFile();
				findProduct.setImage(product.getImageFile().getOriginalFilename());

				try {
					product.getImageFile().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 1);
					model.addAttribute("productBean", product);
					return "admin/admin-createProduct";
				}
			}

			// 4
			findProduct.setProductName(product.getProductName());
			// 5
			findProduct.setPrice(product.getPrice());
			// 6
			findProduct.setQuantity(product.getQuantity());
			// 7
			findProduct.setDetail(product.getDetail());
			// 8
			findProduct.setPostingDate(product.getPostingDate());

			if (!productDAO.updateProduct(findProduct)) {
				System.out.println("checking error");
			}
		}

		return String.format("redirect:/admin/products.htm");
	}

	@RequestMapping("searchProduct")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "crrPage", defaultValue = "1") int crrPage, ModelMap modelMap) {

		List<ProductBean> products = new ArrayList<>();
		List<Product> listProducts = productDAO.filterProductByName(search);
		for (Product p : listProducts) {
			ProductBean bean = new ProductBean(p);
			products.add(bean);
		}

		int startIndex = (crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE_IN_HOME)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
			if (products.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_CATEGORY, products.size())));
		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);
		return "admin/admin-product";
	}

	@RequestMapping(value = "create-product.htm")
	public String pCreateProduct(ModelMap model) {

		ProductBean productBean = new ProductBean();
		model.addAttribute("productBeans", productBean);

		return "admin/admin-createProduct";

	}

	@RequestMapping(value = "create-product.htm", method = RequestMethod.POST)
	public String pCreateProduct(@ModelAttribute("productBean") ProductBean product, HttpSession session,
			ModelMap model) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:employee/logout.htm";
		}
		Product newProduct = new Product();
		newProduct.setAccount(acc);
		Category category = categoryDAO.getCategory(product.getCategoryId());
		if (category != null) {
			newProduct.setCategory(category);
		} else {
			System.out.println(product.getCategoryId() + "doesnt exissst");
			return "redirect:/admin/products.htm";
		}

		if (product.getDiscountId() != -1) {
			Coupon coupon = couponDAO.getCoupon(product.getDiscountId());
			if (coupon != null) {
				newProduct.setCoupon(coupon);
			}
		}

		if (product.getImageFile() != null) {

			File file = new File(productImgDir.getPath() + product.getImageFile());
			if (file.exists())
				file.delete();

			String avatarPath = productImgDir.getPath() + product.getImageFile();
			newProduct.setImage(product.getImageFile().getOriginalFilename());

			try {
				product.getImageFile().transferTo(new File(avatarPath));
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", 1);
				model.addAttribute("productBean", product);
				return "admin/admin-createProduct";
			}

		}

		newProduct.setProductName(product.getProductName());
		newProduct.setPrice(product.getPrice());
		newProduct.setQuantity(product.getQuantity());
		newProduct.setDetail(product.getDetail());
		newProduct.setPostingDate(product.getPostingDate());

		if (!productDAO.insertProduct(newProduct)) {
			System.out.println("error in adding");
		}
		return String.format("redirect:/admin/products.htm");
	}
}
