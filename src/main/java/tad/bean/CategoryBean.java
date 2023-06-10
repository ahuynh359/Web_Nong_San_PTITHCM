package tad.bean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import tad.DAO.ICategoryDAO;
import tad.entity.Category;
import tad.entity.Product;

public class CategoryBean {
	private int id;
	private String name;
	private String image;
	private MultipartFile fileImage;
	private Set<Product> products = new HashSet<>(0);

	public CategoryBean() {
		this.name = "";
		this.image = "";
	}

	public CategoryBean(int id, String name, String image) {
		this.id = id;
		this.name = name;
		this.image = image;
	}

	public CategoryBean(int id, String name, String image, Set<Product> products) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.products = products;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public CategoryBean(String name, String image) {
		this.name = name;
		this.image = image;
	}

	public MultipartFile getFileImage() {
		return fileImage;
	}

	public void setFileImage(MultipartFile fileImage) {
		this.fileImage = fileImage;
	}

	public CategoryBean(Category category) {
		this.id = category.getCategoryId();
		this.name = category.getName();
		this.image = category.getImage();
	}

	public String getName() {
		return this.name;
	}

	public String getImage() {

		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return this.id;
	}

	public static ArrayList<CategoryBean> ConvertListCategory(List<Category> list, ICategoryDAO categoryDAO) {
		ArrayList<CategoryBean> categories = new ArrayList<>();
		for (var categoryData : list) {
			Category fetchCate = categoryDAO != null ? categoryDAO.fetchCategory(categoryData) : categoryData;
			CategoryBean bean = new CategoryBean(fetchCate.getCategoryId(), fetchCate.getName(), fetchCate.getImage(),
					fetchCate.getProducts());
			categories.add(bean);
		}
		return categories;
	}

	public void setId(int id) {
		this.id = id;
	}

}
