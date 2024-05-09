package model;

public class Patient {
	
	int id;
	long patientid;
	String patientname;
	int patientage;
	String gender;
	String patientphonenumber;
	String relativephonenumber;
	String dateofadmit;
	String dateofdischarge;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getPatientid() {
		return patientid;
	}
	public void setPatientid(long string) {
		this.patientid = string;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public int getPatientage() {
		return patientage;
	}
	public void setPatientage(int string) {
		this.patientage = string;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPatientphonenumber() {
		return patientphonenumber;
	}
	public void setPatientphonenumber(String patientphonenumber) {
		this.patientphonenumber = patientphonenumber;
	}
	public String getRelativephonenumber() {
		return relativephonenumber;
	}
	public void setRelativephonenumber(String relativephonenumber) {
		this.relativephonenumber = relativephonenumber;
	}
	public String getDateofadmit() {
		return dateofadmit;
	}
	public void setDateofadmit(String dateofadmit) {
		this.dateofadmit = dateofadmit;
	}
	
	
	public String getDateofdischarge() {
		return dateofdischarge;
	}
	public void setDateofdischarge(String dateofdischarge) {
		this.dateofdischarge = dateofdischarge;
	}
	public Patient(String patientname, int patientage, String gender, String patientphonenumber,
			String relativephonenumber, String dateofadmit) {
		super();
		this.patientname = patientname;
		this.patientage = patientage;
		this.gender = gender;
		this.patientphonenumber = patientphonenumber;
		this.relativephonenumber = relativephonenumber;
		this.dateofadmit = dateofadmit;
		
	
	}
	public Patient() {
		super();
	}
	
	
}
