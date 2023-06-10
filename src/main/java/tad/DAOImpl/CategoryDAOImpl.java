package tad.DAOImpl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICategoryDAO;
import tad.entity.Category;

@Transactional
public class CategoryDAOImpl implements ICategoryDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean deleteCategory(Category category) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(category);
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
	public boolean addCategory(Category newCategory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(newCategory);
			t.commit();
			return true;
		} catch (Exception ex) {
			System.out.println(ex);
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Category> getListCategories() {

		String hql = "From Category";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Category> listCategory = query.list();
		return listCategory;
	}

	@Override
	public List<Category> getListCategoriesHasProduct() {

		String hql = "From Category WHERE SIZE(products) > 0";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Category> listCategory = query.list();
		return listCategory;
	}

	@Override
	public Category getCategory(int id) {
		String hql = "FROM Category WHERE id = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Category category = null;
		try {
			category = (Category) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return category;

	}

	@Override
	public boolean updateCategory(Category changedCategory) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(changedCategory);
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
	public List<Category> searchCategory(String alikeName) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		alikeName = (alikeName == null) ? "%" : "%" + alikeName + "%";

		String hql = "FROM Category WHERE Name LIKE :name";

		Query query = session.createQuery(hql);
		query.setParameter("name", alikeName);

		@SuppressWarnings("unchecked")
		List<Category> list = query.list();

		session.getTransaction().commit();
		session.close();

		return list;
	}

	@Override
	public Category fetchCategory(Category category) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Category fCategory = null;

		try {
			fCategory = (Category) session.get(Category.class, category.getCategoryId());
			Hibernate.initialize(fCategory.getProducts());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Category occur error");
			System.out.println(e);
		} finally {
			session.close();
		}

		return fCategory == null ? category : fCategory;
	}

}
