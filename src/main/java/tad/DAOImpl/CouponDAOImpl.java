package tad.DAOImpl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICouponDAO;
import tad.entity.Account;
import tad.entity.Coupon;
import tad.entity.Product;

@Transactional
public class CouponDAOImpl implements ICouponDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Coupon> listCoupons() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Coupon> list = session.createQuery("FROM Coupon").list();
		return list;
	}

	@Override
	public List<Product> listProductWithCoupon(int limit) {

		return null;
	}

	@Override
	public boolean add(Coupon coupon) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(coupon);
			t.commit();
			return true;
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean update(Coupon coupon) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(coupon);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();

		}
		return false;
	}

	@Override
	public boolean delete(Coupon coupon) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(coupon);
			t.commit();
			return true;

		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Coupon getCoupon(int id) {
		// TODO Auto-generated method stub
		String hql = "FROM Coupon WHERE id = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Coupon coupon = null;
		try {
			coupon = (Coupon) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return coupon;
	}

	@Override
	public Account FetchAccountCoupon(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Account taccount = null;

		try {
			taccount = (Account) session.get(Account.class, account.getAccountId());
			Hibernate.initialize(taccount.getCoupons());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Products occur error");
			System.out.println(e);
		} finally {
			session.close();
		}

		return taccount == null ? account : taccount;
	}

	@Override
	public List<Coupon> listCoupons(int accountId) {
		// TODO Auto-generated method stub
		String hql = "FROM Coupon WHERE account.accountId = :accountId";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("accountId", accountId);
		@SuppressWarnings("unchecked")
		List<Coupon> coupon = query.list();
		return coupon;
	}

}
