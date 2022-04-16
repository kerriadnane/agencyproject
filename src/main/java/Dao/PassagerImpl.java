package Dao;

import java.util.List;

import org.hibernate.Session;

import Entities.Client;
import Entities.Passager;
import hibernateUtil.HibernateUtil;

public class PassagerImpl implements IDaoPassager{

	@Override
	public List<Passager> getAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Passager> liste = session.createQuery("SELECT a FROM Passager a", Passager.class).getResultList();
		session.close();
		return liste;
	}
	@Override
	public Passager getPassager(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Passager passager = session.load(Passager.class, id);
		session.close();
		return passager;
	}
	@Override
	public Passager addPassager(Passager passager) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.persist(passager);
		session.getTransaction().commit();
		session.close();
		return passager;
	}
	@Override
	public void deletePassager(Passager passager) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.remove(passager);
		session.flush();
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public Passager updatePassager(Passager p, Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Passager passager = this.getPassager(id);
		session.getTransaction().begin();
		session.evict(passager);
		passager.setNom(p.getNom());
		passager.setPrenom(p.getPrenom());
		passager.setAdresse(p.getAdresse());
		passager.setTel(p.getTel());
		passager.setEmail(p.getEmail());
		session.merge(passager);
		session.getTransaction().commit();
		session.close();
		return passager;
	}
	
	
}
