package model;

public class User {
	
	private int id;
	private String firstname;
	private String lastname;
	private String email;
	private String role;
	private String contact;
	private String password;
	private long idnum;
	private String ward;
	
	
	public long getIdnum() {
		return idnum;
	}
	public void setIdnum(long idnum) {
		this.idnum = idnum;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User() {
		super();
	}
	public User( String firstname, String lastname, String email, String contact, String password, String ward) {
		super();
		
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.contact = contact;
		this.password = password;
		this.ward=ward;
		
	}
	
	
	

}