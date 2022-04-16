package Entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Aereport {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nom;
	
	private String ville;
	
	@OneToMany(mappedBy = "aereport_dep")
	private List<Vol> vols_dep;
	
	@OneToMany(mappedBy = "aereport_arr")
	private List<Vol> vols_arr;
	
	
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
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public List<Vol> getVols_dep() {
		return vols_dep;
	}
	public void setVols_dep(List<Vol> vols_dep) {
		this.vols_dep = vols_dep;
	}
	public List<Vol> getVols_arr() {
		return vols_arr;
	}
	public void setVols_arr(List<Vol> vols_arr) {
		this.vols_arr = vols_arr;
	}
	public Aereport(String nom, String ville) {
		super();
		this.nom = nom;
		this.ville = ville;
	}
	public Aereport() {
		super();
	}
	
	
}
