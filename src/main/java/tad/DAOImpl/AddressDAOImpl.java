package tad.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;

@Transactional
public class AddressDAOImpl implements IAddressDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Autowired
	private IAccountDAO accountDAO;

	@Override
	public Account fetchAddressAccount(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Account taccount = null;
		try {
			taccount = (Account) session.get(Account.class, account.getAccountId());
			Hibernate.initialize(taccount.getAddresses());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Address occur error");
			System.out.println(e);
		} finally {
			session.close();
		}
		return taccount == null ? account : taccount;
	}

	@Override
	public ArrayList<Province> getProvinceList() {
		// TODO Auto-generated method stub
		String hql = "From Province";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Province> listProvince = (ArrayList<Province>) query.list();
		return listProvince;
	}

	@Override
	public boolean insertAddress(Account account, Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(address);
			t.commit();
			session.close();

			account = fetchAddressAccount(account);
			account.getAddresses().add(address);

			return accountDAO.updateAccount(account);
		} catch (Exception ex) {
			t.rollback();
			System.out.println("Create Address occur error");
			System.out.println(ex);
		} finally {
			if (session.isOpen())
				session.close();
		}
		return false;
	}

	@Override
	public boolean updateAddress(Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(address);
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
	public boolean deleteAddress(Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(address);
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
	public Address getAddress(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Address Where AddressID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Address add = null;
		try {
			add = (Address) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return add;
	}

	@Override
	public Ward getWard(int id) {
		// TODO Auto-generated method stub
		String hql = "From Ward where WardID = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Ward ward = null;
		try {
			ward = (Ward) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return ward;
	}

	@Override
	public List<Address> getAddressesByAccountId(int accountId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Address Where account.accountId = :accountId";
		Query query = session.createQuery(hql);
		query.setParameter("accountId", accountId);
		@SuppressWarnings("unchecked")
		List<Address> a = query.list();
		return a;
	}

}
