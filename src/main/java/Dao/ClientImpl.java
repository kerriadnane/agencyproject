package Dao;

import java.util.List;

import org.hibernate.Session;
import Entities.Client;
import hibernateUtil.HibernateUtil;

public class ClientImpl implements IDaoClient{

	@Override
	public List<Client> getAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Client> liste = session.createQuery("SELECT a FROM Client a", Client.class).getResultList();
		session.close();
		return liste;
	}

	@Override
	public Client getClient(Long id) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		Client client = session.load(Client.class, id);
		session.getTransaction().commit();
		session.close();
		return client;
	}

	@Override
	public Client addClient(Client c) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.persist(c);
		session.getTransaction().commit();
		session.close();
		return c;
	}

	@Override
	public void deleteClient(Client c) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		session.remove(c);
		session.flush();
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Client updateClient(Client c, Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Client client = this.getClient(id);
		session.getTransaction().begin();
		session.evict(client);
		client.setNom(c.getNom());
		client.setPrenom(c.getPrenom());
		client.setAdresse(c.getAdresse());
		client.setTel(c.getTel());
		client.setEmail(c.getEmail());
		session.merge(client);
		session.getTransaction().commit();
		session.close();
		return client;
	}

}
