package Dao;

import org.hibernate.Session;

import Entities.Vol;
import hibernateUtil.HibernateUtil;

public class VolImpl implements IDaoVol{
	
	@Override
	public Vol addVol(Vol vol) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.save(vol);
		session.getTransaction().commit();
		session.close();
		return vol;
	}
	@Override
	public Vol getVol(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Vol vol = session.load(Vol.class, id);
		session.close();
		return vol;
	}
	

}
