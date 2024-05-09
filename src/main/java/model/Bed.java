package model;

public class Bed {
	int id;
	String bedno;
	String Rent;
	String nod;
	String type;
	long patientid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBedno() {
		return bedno;
	}
	public void setBedno(String bedno) {
		this.bedno = bedno;
	}
	public String getRent() {
		return Rent;
	}
	public void setRent(String rent) {
		Rent = rent;
	}
	public String getNod() {
		return nod;
	}
	public void setNod(String nod) {
		this.nod = nod;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getPatientid() {
		return patientid;
	}
	public void setPatientid(long patientid) {
		this.patientid = patientid;
	}
	public Bed(String bedno, String rent, String type) {
		super();
		this.bedno = bedno;
		Rent = rent;
		this.type = type;
	}
	public Bed() {
		super();
	}
	
	

}
