package response;

public class ResCompany {
	private Long id;
	private String nom;
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
	public ResCompany(Long id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}
	
	
}
