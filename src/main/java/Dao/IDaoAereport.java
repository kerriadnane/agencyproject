package Dao;

import java.util.List;

import Entities.Aereport;

public interface IDaoAereport {
	public List<Aereport> getAll();
	public Aereport getAereport(Long id);
}
