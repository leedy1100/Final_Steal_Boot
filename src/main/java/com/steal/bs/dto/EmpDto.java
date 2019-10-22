package com.steal.bs.dto;

public class EmpDto {

	private int emp_no;
	private String emp_name;
	
	public EmpDto() {
		super();
	}

	public EmpDto(int emp_no, String emp_name) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
}
