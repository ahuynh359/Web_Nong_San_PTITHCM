package tad.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IWishlistDAO;
import tad.entity.Wishlist;

@Transactional
public class WishlistDAOImpl implements IWishlistDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean insertWishlist(Wishlist wishlist) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(wishlist);
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
	public boolean deleteWishlist(Wishlist wishlist) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(wishlist);
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
	public boolean updateWishlist(Wishlist wishlist) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(wishlist);
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
	public Wishlist getWishlist(int accountId, int productId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Wishlist WHERE account.accountId = :accountId AND product.productId = :productId";
		Query query = session.createQuery(hql);

		query.setInteger("accountId", accountId);
		query.setInteger("productId", productId);

		Wishlist list = (Wishlist) query.uniqueResult();
		return list;
	}

	@Override
	public List<Wishlist> Wishlist(int accountId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Wishlist WHERE account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setInteger("accountId", accountId);

		@SuppressWarnings("unchecked")
		List<Wishlist> list = query.list();
		return list;
	}

	@Override
	public int removeWishlist(int accountId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Wishlist> getWishlist(int accountId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Wishlist WHERE account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setInteger("accountId", accountId);

		@SuppressWarnings("unchecked")
		List<Wishlist> list = query.list();
		return list;
	}

}
