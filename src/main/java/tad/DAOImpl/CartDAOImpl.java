package tad.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICartDAO;
import tad.entity.Cart;
import tad.entity.Coupon;

@Transactional
public class CartDAOImpl implements ICartDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean insertCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(cart);
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
	public boolean deleteCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(cart);
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
	public Coupon getCoupon(String coupon) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateQuantity(int productId, int quantity) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Cart SET quantity = :quantity " + "WHERE product.productId = :productId";
		Query query = session.createQuery(hql);
		query.setParameter("productId", productId);
		query.setParameter("quantity", quantity);
		int result = query.executeUpdate();
		return result;
	}

	@Override
	public Cart getCart(int accountId, int productId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Cart  WHERE account.accountId = :accountId AND product.productId = :productId";
		Query query = session.createQuery(hql);

		query.setInteger("accountId", accountId);
		query.setInteger("productId", productId);

		Cart cart = (Cart) query.uniqueResult();
		return cart;
	}

	@Override
	public List<Cart> getCart(int accountId) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Cart WHERE account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setInteger("accountId", accountId);

		@SuppressWarnings("unchecked")
		List<Cart> list = query.list();
		return list;
	}

	@Override
	public int removeCart(int accountId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "DELETE FROM Cart " + "WHERE account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setParameter("accountId", accountId);
		int result = query.executeUpdate();
		return result;
	}

	@Override
	public int updateCoupon(String coupon, int amount) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(cart);
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

}
