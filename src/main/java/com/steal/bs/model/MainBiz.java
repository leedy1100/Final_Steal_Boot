package com.steal.bs.model;

public interface MainBiz {
	
	MainDto selectOne(MainDto dto);
	int insert(MainDto dto);
	int update(MainDto dto);
	int delete(int seq);
	String loginidchk(String id);
	String signupempchk(String emp);
	String updatepwchk(String seq);
	String idsearch(MainDto dto);
	String pwsearch(MainDto dto);
	
}
