package Dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Session;

import Entities.Users;
import hibernateUtil.HibernateUtil;

public class UserImpl implements IDaoUser{
	
	//private Session session = (Session) HibernateUtil.getSessionFactory();
	
	@Override
	public Users getUser(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Users user = null;
		try {
			Query query =session.createSQLQuery("SELECT * FROM Users u WHERE u.userName = :un AND u.password= :ps")
					.addEntity(Users.class);
		    query.setParameter("un", username);
		    query.setParameter("ps", password);
		    user = (Users) query.getSingleResult();
		}catch(NoResultException e) {
			
		}
		
		return user;
       
	}

}
