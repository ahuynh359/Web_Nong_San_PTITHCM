package tad.DAO;

import java.util.Date;
import java.util.List;

import tad.entity.Account;
import tad.entity.Product;

public interface IProductDAO {

	List<Product> listProducts();

	List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate);

	List<Product> listProducts(int accountId);

	List<Product> filterProductByName(String name);

	List<Product> listProductsWithCoupon();

	List<Product> listNewProducts();

	List<Product> listBestSellerProducts();

	List<Product> listProductsInCategory(int categoryId);

	boolean insertProduct(Product product);

	boolean updateProduct(Product product);

	boolean deleteProduct(Product product);

	public Product getProduct(int id);

	public Account fetchProductsAccount(Account acc);
}
