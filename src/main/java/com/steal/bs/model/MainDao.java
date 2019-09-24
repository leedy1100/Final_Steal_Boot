package com.steal.bs.model;

public interface MainDao {

	String namespace= "main.";

	MainDto selectOne(MainDto dto);
	int insert(MainDto dto);
	int update(MainDto dto);
	int delete(int seq);
	String loginidchk(String id);
	String signupempchk(String emp);
	
}
