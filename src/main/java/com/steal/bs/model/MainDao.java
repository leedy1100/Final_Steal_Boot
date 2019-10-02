package com.steal.bs.model;

public interface MainDao {

	String namespace= "main.";

	MainDto selectOne(String id);
	int insert(MainDto dto);
	int update(MainDto dto);
	int delete(int seq);
	String loginidchk(String id);
	String signupempchk(String emp);
	String updatepwchk(String seq);
	String idsearch(MainDto dto);
	String pwsearch(MainDto dto);
	
}
