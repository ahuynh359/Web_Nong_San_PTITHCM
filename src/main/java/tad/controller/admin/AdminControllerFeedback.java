package tad.controller.admin;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IFeedbackDAO;
import tad.entity.Feedback;
import tad.utility.Constants;

@Controller
@RequestMapping("/admin/feedback")
public class AdminControllerFeedback {

	@Autowired
	private IFeedbackDAO feedbackDAO;

	@RequestMapping()
	public String gCategoryList(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage,
			@RequestParam(value = "filter", defaultValue = "0") int filter) {

		List<Feedback> feedbacks = feedbackDAO.listFeedback();

		if (filter == 1) {
			feedbacks = feedbacks.stream().filter(r -> r.getRatingStar() == 1).collect(Collectors.toList());
		} else if (filter == 2) {
			feedbacks = feedbacks.stream().filter(r -> r.getRatingStar() == 2).collect(Collectors.toList());
		} else if (filter == 3) {
			feedbacks = feedbacks.stream().filter(r -> r.getRatingStar() == 3).collect(Collectors.toList());
		} else if (filter == 4) {
			feedbacks = feedbacks.stream().filter(r -> r.getRatingStar() == 4).collect(Collectors.toList());
		} else if (filter == 5) {
			feedbacks = feedbacks.stream().filter(r -> r.getRatingStar() == 5).collect(Collectors.toList());
		}

		int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE;
		int totalPage = 1;
		if (feedbacks.size() <= Constants.USER_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = feedbacks.size() / Constants.USER_PER_PAGE;
			if (feedbacks.size() % Constants.USER_PER_PAGE != 0) {
				totalPage++;
			}
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("crrPage", crrPage);
		model.addAttribute("list",
				feedbacks.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, feedbacks.size())));
		model.addAttribute("filter", filter);
		return "admin/admin-feedback";
	}

	@RequestMapping(value = "enable")
	public String enableFeedback(@RequestParam("id") int id) {
		Feedback feedback = feedbackDAO.getFeedback(id);
		if (feedback != null) {
			System.out.println(feedback.getStatus());
			if (feedback.getStatus() == 1)
				feedback.setStatus(0);
			else if (feedback.getStatus() == 0)
				feedback.setStatus(1);
			feedbackDAO.updateFeedback(feedback);
		}

		return "redirect:/admin/feedback.htm";
	}

}
