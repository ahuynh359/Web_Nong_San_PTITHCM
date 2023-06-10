package tad.DAOImpl;

import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IProductDAO;
import tad.entity.Account;
import tad.entity.Product;

@Transactional
public class ProductDAOImpl implements IProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Product> listProducts() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("FROM Product").list();
		return list;
	}

	@Override
	public List<Product> listProducts(int accountId) {
		String hql = "FROM Product WHERE account.accountId = :accountId";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("accountId", accountId);
		@SuppressWarnings("unchecked")
		List<Product> product = query.list();

		return product;
	}

	@Override
	public List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate) {
		return null;
	}

	@Override
	public boolean insertProduct(Product product) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(product);
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
	public boolean updateProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(product);
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
	public boolean deleteProduct(Product product) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
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
	public List<Product> filterProductByName(String name) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		name = (name == null) ? "%" : "%" + name + "%";

		String hql = "FROM Product WHERE ProductName LIKE :name";

		Query query = session.createQuery(hql);
		query.setParameter("name", name);

		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		session.getTransaction().commit();
		session.close();
		return list;

	}

	@Override
	public List<Product> listProductsWithCoupon() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product P WHERE current_date() >= P.coupon.postingDate AND current_date() <= P.coupon.expiryDate ORDER BY P.coupon.discount DESC";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		return list;
	}

	@Override
	public List<Product> listNewProducts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product ORDER BY postingDate DESC ";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		return list;
	}

	@Override
	public Account fetchProductsAccount(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Account taccount = null;

		try {
			taccount = (Account) session.get(Account.class, account.getAccountId());
			Hibernate.initialize(taccount.getProducts());
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
	public Product getProduct(int id) {
		String hql = "FROM Product WHERE id = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Product product = null;
		try {
			product = (Product) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return product;
	}

	@Override
	public List<Product> listProductsInCategory(int categoryId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product WHERE category.categoryId = :categoryId ORDER BY postingDate DESC";
		Query query = session.createQuery(hql);
		query.setParameter("categoryId", categoryId);
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		return list;
	}

	@Override
	public List<Product> listBestSellerProducts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product WHERE SIZE(orderDetails) > 0 ORDER BY SIZE(orderDetails) DESC";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		return list;
	}

}
