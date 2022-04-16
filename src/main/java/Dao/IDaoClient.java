package Dao;

import java.util.List;

import Entities.Client;

public interface IDaoClient {
	public List<Client> getAll();
	public Client getClient(Long id);
	public Client addClient(Client c);
	public void deleteClient(Client c);
	public Client updateClient(Client c, Long id);
}
