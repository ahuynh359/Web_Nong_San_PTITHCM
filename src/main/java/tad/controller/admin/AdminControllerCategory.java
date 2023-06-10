package tad.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.ICategoryDAO;
import tad.bean.CategoryBean;
import tad.bean.UploadFile;
import tad.entity.Category;
import tad.utility.Constants;

@Controller
@RequestMapping("/admin/category")
public class AdminControllerCategory {

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	@Qualifier("categoryImgDir")
	private UploadFile categoryImgDir;

	@RequestMapping()
	public String gCategoryList(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage,
			@RequestParam(value = "filter", defaultValue = "0") int filter) {

		List<Category> categories = categoryDAO.getListCategories();

		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (categories.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = categories.size() / Constants.USER_PER_PAGE;
			if (categories.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("crrPage", crrPage);
		List<CategoryBean> categoriesBean = CategoryBean.ConvertListCategory(
				categories.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, categories.size())),
				categoryDAO);

		if (filter == 1) {
			categoriesBean = categoriesBean.stream().filter(r -> r.getProducts().size() == 0)
					.collect(Collectors.toList());
		} else if (filter == 2) {
			categoriesBean = categoriesBean.stream().filter(r -> r.getProducts().size() > 0)
					.collect(Collectors.toList());
		}
		model.addAttribute("list", categoriesBean);
		model.addAttribute("filter", filter);
		return "admin/admin-category";
	}

	@RequestMapping("searchCategory")
	public String gCategoryWithSearch(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "crrPage", defaultValue = "1") int crrPage, ModelMap model) {
		List<Category> categories = categoryDAO.searchCategory(search);
		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (categories.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = categories.size() / Constants.USER_PER_PAGE;
			if (categories.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}

		model.addAttribute("crrPage", crrPage);
		model.addAttribute("totalPage", totalPage);
		ArrayList<CategoryBean> categoriesBean = CategoryBean.ConvertListCategory(categories.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, categories.size())), categoryDAO);
		model.addAttribute("list", categoriesBean);
		model.addAttribute("filter", 0);
		return "admin/admin-category";
	}

	@RequestMapping("add")
	public String gCategoryAdd(ModelMap modelMap) {
		Category category = new Category();
		CategoryBean categoryBean = new CategoryBean(category.getCategoryId(), category.getName(), category.getImage());
		modelMap.addAttribute("addBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping("update{id}")
	public String gCategoryUpdate(@PathVariable("id") int id, ModelMap modelMap) {
		Category category = categoryDAO.getCategory(id);
		CategoryBean categoryBean = new CategoryBean(category);
		modelMap.addAttribute("updateBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String pCategoryAdd(@ModelAttribute("addBean") CategoryBean categoryBean, ModelMap model) {
		if (categoryBean != null) {
			Category category = new Category();

			category.setName(categoryBean.getName());
			if (categoryBean.getFileImage().isEmpty()) {

			} else {
				File file = new File(categoryImgDir.getPath() + categoryBean.getFileImage());
				if (file.exists())
					file.delete();

				String avatarPath = categoryImgDir.getPath() + categoryBean.getFileImage();
				category.setImage(categoryBean.getFileImage().getOriginalFilename());

				try {
					categoryBean.getFileImage().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 1);
					model.addAttribute("categoryBean", categoryBean);
					return "admin/admin-category-form";
				}
			}
			categoryDAO.addCategory(category);
			model.addAttribute("message", 2);
		}

		return "redirect:/admin/category.htm";
	}

	@Autowired
	@Qualifier("categoryImgDir")
	private UploadFile uploadCategory;

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String pCategoryUpdate(@ModelAttribute("updateBean") CategoryBean categoryBean, ModelMap model) {
		Category category = categoryDAO.getCategory(categoryBean.getId());
		if (category != null) {
			category.setName(categoryBean.getName());

			if (categoryBean.getFileImage().isEmpty()) {

			} else {
				File file = new File(categoryImgDir.getPath() + categoryBean.getFileImage());
				if (file.exists())
					file.delete();
				String avatarPath = String.format("%s%s", categoryImgDir.getPath(),
						categoryBean.getFileImage().getOriginalFilename());
				category.setImage(categoryBean.getFileImage().getOriginalFilename());

				try {
					categoryBean.getFileImage().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 1);
					model.addAttribute("categoryBean", categoryBean);
					return "admin/admin-category-form";
				}
			}
			categoryDAO.updateCategory(category);
			model.addAttribute("message", 2);

		}

		return "redirect:/admin/category.htm";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String pCategoryDelete(@RequestParam("id") int id, RedirectAttributes reAttributes) {
		Category category = categoryDAO.getCategory(id);
		if (categoryDAO.deleteCategory(category)) {
			reAttributes.addFlashAttribute("alert", 2);
		} else {
			reAttributes.addFlashAttribute("alert", 1);
		}

		return "redirect:/admin/category.htm";
	}
}
