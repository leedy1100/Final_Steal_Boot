package com.steal.bs.model;

public class MainDto {
	
	private int main_seq;
	private double main_security;
	private String main_name;
	private String main_id;
	private String main_password;
	private char main_sex;
	private String main_phonenumber;
	private String main_email;
	private int main_birth;
	private int main_emp;
	
	public MainDto() {}
	
	public MainDto(int main_seq, double main_security, String main_name, String main_id, String main_password,
			char main_sex, String main_phonenumber, String main_email, int main_birth, int main_emp) {
		this.main_seq = main_seq;
		this.main_security = main_security;
		this.main_name = main_name;
		this.main_id = main_id;
		this.main_password = main_password;
		this.main_sex = main_sex;
		this.main_phonenumber = main_phonenumber;
		this.main_email = main_email;
		this.main_birth = main_birth;
		this.main_emp = main_emp;
	}

	public int getMain_seq() {
		return main_seq;
	}

	public void setMain_seq(int main_seq) {
		this.main_seq = main_seq;
	}

	public double getMain_security() {
		return main_security;
	}

	public void setMain_security(double main_security) {
		this.main_security = main_security;
	}

	public String getMain_name() {
		return main_name;
	}

	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}

	public String getMain_id() {
		return main_id;
	}

	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}

	public String getMain_password() {
		return main_password;
	}

	public void setMain_password(String main_password) {
		this.main_password = main_password;
	}

	public char getMain_sex() {
		return main_sex;
	}

	public void setMain_sex(char main_sex) {
		this.main_sex = main_sex;
	}

	public String getMain_phonenumber() {
		return main_phonenumber;
	}

	public void setMain_phonenumber(String main_phonenumber) {
		this.main_phonenumber = main_phonenumber;
	}

	public String getMain_email() {
		return main_email;
	}

	public void setMain_email(String main_email) {
		this.main_email = main_email;
	}

	public int getMain_birth() {
		return main_birth;
	}

	public void setMain_birth(int main_birth) {
		this.main_birth = main_birth;
	}

	public int getMain_emp() {
		return main_emp;
	}

	public void setMain_emp(int main_emp) {
		this.main_emp = main_emp;
	}

	@Override
	public String toString() {
		return "MainDto [main_seq=" + main_seq + ", main_security=" + main_security + ", main_name=" + main_name
				+ ", main_id=" + main_id + ", main_password=" + main_password + ", main_sex=" + main_sex
				+ ", main_phonenumber=" + main_phonenumber + ", main_email=" + main_email + ", main_birth=" + main_birth
				+ ", main_emp=" + main_emp + "]";
	}

}
