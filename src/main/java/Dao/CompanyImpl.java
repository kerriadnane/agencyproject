package Dao;

import java.util.List;

import org.hibernate.Session;


import Entities.Company;
import hibernateUtil.HibernateUtil;

public class CompanyImpl implements IDaoCompany{

	@Override
	public List<Company> getAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Company> liste = session.createQuery("SELECT a FROM Company a", Company.class).getResultList();
		session.close();
		return liste;
	}

	@Override
	public Company getCompany(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Company company = session.load(Company.class, id);
		session.close();
		return company;
	}

}
