package tad.DAOImpl;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IFeedbackDAO;
import tad.entity.Feedback;

@Transactional
public class FeedbackDAOImpl implements IFeedbackDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean insertFeedback(Feedback feedback) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(feedback);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateFeedback(Feedback feedback) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(feedback);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteFeedback(Feedback feedback) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(feedback);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Feedback getFeedback(int accountId, int productId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Feedback WHERE product.productId = :productId AND account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setInteger("productId", productId);
		query.setInteger("accountId", accountId);
		Feedback feedback = (Feedback) query.uniqueResult();
		return feedback;
	}

	@Override
	public List<Feedback> listFeedback(int productId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Feedback WHERE product.productId = :productId AND status = 1 ORDER BY postingDate DESC	";
		Query query = session.createQuery(hql);
		query.setInteger("productId", productId);
		@SuppressWarnings("unchecked")
		List<Feedback> feedback = query.list();
		return feedback;
	}

	@Override
	public List<Feedback> listFeedback(int productId, int feedbackFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Feedback> listByStars(int productId, int rateFilter) {
		List<Feedback> list = listFeedback(productId);

		switch (rateFilter) {
		case 0:
			break;
		case 1:
			list.sort(new Comparator<Feedback>() {
				@Override
				public int compare(Feedback a, Feedback b) {
					return b.getRatingStar() - a.getRatingStar();
				}
			});
			break;
		case 2:
			list = filterByStar(list, 5);
			break;
		case 3:
			list = filterByStar(list, 4);
			break;
		case 4:
			list = filterByStar(list, 3);
			break;
		case 5:
			list = filterByStar(list, 2);
			break;
		case 6:
			list = filterByStar(list, 1);
			break;
		}

		return list;
	}

	private List<Feedback> filterByStar(List<Feedback> list, int star) {
		return list.stream().filter(rate -> rate.getRatingStar() == star).collect(Collectors.toList());
	}

	@Override
	public List<Feedback> listFeedback() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Feedback";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Feedback> feedback = query.list();
		return feedback;
	}

	@Override
	public List<Feedback> searchFeedback(String search) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		search = (search == null) ? "%" : "%" + search + "%";

		String hql = "FROM Feedback WHERE feedbackId LIKE :name";

		Query query = session.createQuery(hql);
		query.setParameter("name", search);

		@SuppressWarnings("unchecked")
		List<Feedback> list = query.list();

		session.getTransaction().commit();
		session.close();

		return list;
	}

	@Override
	public Feedback getFeedback(int feedbackId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Feedback WHERE feedbackId = :feedbackId";
		Query query = session.createQuery(hql);
		query.setInteger("feedbackId", feedbackId);
		Feedback feedback = (Feedback) query.uniqueResult();
		return feedback;
	}

}
