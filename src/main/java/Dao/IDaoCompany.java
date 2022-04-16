package Dao;

import java.util.List;

import Entities.Company;

public interface IDaoCompany {
	public List<Company> getAll();
	public Company getCompany(Long id);
}
