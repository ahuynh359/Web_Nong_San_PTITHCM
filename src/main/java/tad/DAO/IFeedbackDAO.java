package tad.DAO;

import java.util.List;

import tad.entity.Feedback;

public interface IFeedbackDAO {
	boolean insertFeedback(Feedback feedback);

	boolean updateFeedback(Feedback feedback);

	boolean deleteFeedback(Feedback feedback);

	Feedback getFeedback(int accountId, int productId);

	Feedback getFeedback(int feedbackId);

	List<Feedback> listFeedback(int productId);

	List<Feedback> listFeedback(int productId, int feedbackFilter);

	List<Feedback> listFeedback();

	List<Feedback> searchFeedback(String search);

	// 0 Moi Nhat
	// 1 Tu 5 sao - 1 sao
	// 2 Loc 5 Sao
	// 3 Loc 4 sao
	// 4 Loc 3 sao
	// 5 Loc 2 sao
	// 6 Loc 1 sao

	List<Feedback> listByStars(int productId, int rateFilter);
}
