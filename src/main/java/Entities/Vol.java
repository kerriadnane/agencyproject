package Entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Vol {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Date date_depart;
	private String heure_debart;
	private Date date_arrive;
	private String heure_arrive;
	@OneToMany(mappedBy = "vol")
	private List<Reservation> reservations;
	@ManyToOne
	private Company company;
	@ManyToOne
	private Aereport aereport_dep;
	@ManyToOne
	private Aereport aereport_arr;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate_depart() {
		return date_depart;
	}

	public void setDate_depart(Date date_depart) {
		this.date_depart = date_depart;
	}

	public String getHeure_debart() {
		return heure_debart;
	}

	public void setHeure_debart(String heure_debart) {
		this.heure_debart = heure_debart;
	}

	public Date getDate_arrive() {
		return date_arrive;
	}

	public void setDate_arrive(Date date_arrive) {
		this.date_arrive = date_arrive;
	}

	public String getHeure_arrive() {
		return heure_arrive;
	}

	public void setHeure_arrive(String heure_arrive) {
		this.heure_arrive = heure_arrive;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}
	
	
	public Aereport getAereport_dep() {
		return aereport_dep;
	}

	public void setAereport_dep(Aereport aereport_dep) {
		this.aereport_dep = aereport_dep;
	}

	public Aereport getAereport_arr() {
		return aereport_arr;
	}

	public void setAereport_arr(Aereport aereport_arr) {
		this.aereport_arr = aereport_arr;
	}

	
	public Vol(Date date_depart, String heure_debart, Date date_arrive, String heure_arrive, Company company,
			Aereport aereport_dep, Aereport aereport_arr) {
		super();
		this.date_depart = date_depart;
		this.heure_debart = heure_debart;
		this.date_arrive = date_arrive;
		this.heure_arrive = heure_arrive;
		this.company = company;
		this.aereport_dep = aereport_dep;
		this.aereport_arr = aereport_arr;
	}

	public Vol() {
		
	}
	
	
}
