package response;

import java.util.Date;

public class ResReservation {
private Long idreservation;
private Date date_res;
private Long idclient;
private Long idpassager;
private Long idvol;
private Double prix;
private String nom_client;
private String prenom_client;
private String nom_passager;
private String prenom_passager;
private String aereport_dep;
private String aereport_arr;
public Long getIdreservation() {
	return idreservation;
}
public void setIdreservation(Long idreservation) {
	this.idreservation = idreservation;
}

public Date getDate_res() {
	return date_res;
}
public void setDate_res(Date date_res) {
	this.date_res = date_res;
}
public Long getIdclient() {
	return idclient;
}
public void setIdclient(Long idclient) {
	this.idclient = idclient;
}

public Long getIdpassager() {
	return idpassager;
}
public void setIdpassager(Long idpassager) {
	this.idpassager = idpassager;
}
public Long getIdvol() {
	return idvol;
}
public void setIdvol(Long idvol) {
	this.idvol = idvol;
}
public Double getPrix() {
	return prix;
}
public void setPrix(Double prix) {
	this.prix = prix;
}
public String getNom_client() {
	return nom_client;
}
public void setNom_client(String nom_client) {
	this.nom_client = nom_client;
}
public String getPrenom_client() {
	return prenom_client;
}
public void setPrenom_client(String prenom_client) {
	this.prenom_client = prenom_client;
}
public String getNom_passager() {
	return nom_passager;
}
public void setNom_passager(String nom_passager) {
	this.nom_passager = nom_passager;
}
public String getPrenom_passager() {
	return prenom_passager;
}
public void setPrenom_passager(String prenom_passager) {
	this.prenom_passager = prenom_passager;
}
public String getAereport_dep() {
	return aereport_dep;
}
public void setAereport_dep(String aereport_dep) {
	this.aereport_dep = aereport_dep;
}
public String getAereport_arr() {
	return aereport_arr;
}
public void setAereport_arr(String aereport_arr) {
	this.aereport_arr = aereport_arr;
}
public ResReservation(Long idreservation, Date date_res, Long idclient, Long idpassager, Long idvol, Double prix, String nom_client,
		String prenom_client, String nom_passager, String prenom_passager, String aereport_dep, String aereport_arr) {
	super();
	this.idreservation = idreservation;
	this.date_res = date_res;
	this.idclient = idclient;
	this.idpassager = idpassager;
	this.idvol = idvol;
	this.prix = prix;
	this.nom_client = nom_client;
	this.prenom_client = prenom_client;
	this.nom_passager = nom_passager;
	this.prenom_passager = prenom_passager;
	this.aereport_dep = aereport_dep;
	this.aereport_arr = aereport_arr;
}


}
