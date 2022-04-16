package Dao;

import java.util.List;

import org.hibernate.Session;


import Entities.Reservation;
import hibernateUtil.HibernateUtil;

public class ReservationImpl implements IDaoReservation{
	
	@Override
	public Reservation addReservation(Reservation r) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.save(r);
		session.getTransaction().commit();
		session.close();
		return r;
	}

	@Override
	public List<Reservation> getAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Reservation> liste = session.createQuery("SELECT a FROM Reservation a", Reservation.class).getResultList();
		session.close();
		return liste;
	}

	@Override
	public Reservation getReservation(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Reservation reservation = session.load(Reservation.class, id);
		session.close();
		return reservation;
	}

	@Override
	public void deleteReservation(Reservation r) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.remove(r);
		session.flush();
		session.getTransaction().commit();
		session.close();
	}

}
