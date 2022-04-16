package Dao;

import java.util.List;

import org.hibernate.Session;

import Entities.Aereport;
import hibernateUtil.HibernateUtil;

public class AereportImpl implements IDaoAereport{
	@Override
	public List<Aereport> getAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Aereport> liste = session.createQuery("SELECT a FROM Aereport a", Aereport.class).getResultList();
		session.close();
		return  liste;
	}
	@Override
	public Aereport getAereport(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Aereport a = session.load(Aereport.class, id);
		session.close();
		return a;
	}

}
