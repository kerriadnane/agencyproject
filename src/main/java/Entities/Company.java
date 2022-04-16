package Entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Company {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nom;
	
	
	@OneToMany(mappedBy = "company")
	private List<Vol> vols;
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public List<Vol> getVols() {
		return vols;
	}
	
	public void setVols(List<Vol> vols) {
		this.vols = vols;
	}
	
	public Company(String nom) {
		super();
		this.nom = nom;
		
	}
	
	public Company() {
		
	}
	
	
}
