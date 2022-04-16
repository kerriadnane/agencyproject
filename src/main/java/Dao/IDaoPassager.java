package Dao;
import java.util.List;

import Entities.Passager;
public interface IDaoPassager {
	public List<Passager> getAll();
	public Passager getPassager(Long id);
	public Passager addPassager(Passager passager);
	public void deletePassager(Passager passager);
	public Passager updatePassager(Passager passager, Long id);
}
