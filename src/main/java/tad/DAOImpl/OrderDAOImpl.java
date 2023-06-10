package tad.DAOImpl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IOrderDAO;
import tad.entity.OrderDetail;
import tad.entity.Orders;

@Transactional
public class OrderDAOImpl implements IOrderDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Orders> getOrderFromAccount(int accountId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Orders WHERE account.accountId = " + accountId;
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> list = session.createQuery(hql).list();
		return list;
	}

	@Override
	public List<Orders> getOrderFromProduct(int productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetail> getOrderDetail(int orderId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM OrderDetail WHERE order.orderId = " + orderId;
		@SuppressWarnings("unchecked")
		List<OrderDetail> list = session.createQuery(hql).list();
		return list;

	}

	@Override
	public boolean insertOrder(Orders order) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.save(order);
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
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.save(orderDetail);
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
	public boolean updateOrder(Orders order) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.saveOrUpdate(order);
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
	public List<Orders> getUnresolveOrders() {
		// TODO Auto-generated method stub
		String hql = "From Orders where StatusOrder = 0";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getMovingOrders() {
		String hql = "From Orders where StatusOrder = 1";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getResolveOrders() {
		String hql = "From Orders where StatusOrder = 2";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public List<Orders> getCancelOrders() {
		String hql = "From Orders where StatusOrder = 3";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Orders> listOrders = query.list();
		return listOrders;
	}

	@Override
	public boolean update(Orders order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(order);
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
	public Orders fetchOrderDetail(Orders order) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Orders tOrder = null;
		try {
			tOrder = (Orders) session.get(Orders.class, order.getOrderId());
			Hibernate.initialize(tOrder.getOrderDetails());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Order occur error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tOrder == null ? order : tOrder;
	}

	@Override
	public Orders findOrder(int id) {
		String hql = "FROM Orders WHERE orderId = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Orders order = null;
		try {
			order = (Orders) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return order;
	}

	@Override
	public List<Orders> getOrders() {
		String hql = "From Orders";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Orders> listOrders = query.list();
		return listOrders;
	}
}
