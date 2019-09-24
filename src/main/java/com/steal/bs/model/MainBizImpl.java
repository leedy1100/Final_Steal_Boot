package com.steal.bs.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainBizImpl implements MainBiz{

	@Autowired
	private MainDao dao;
	
	@Override
	public MainDto selectOne(MainDto dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(MainDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(MainDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int seq) {
		return dao.delete(seq);
	}

	@Override
	public String loginidchk(String id) {
		return dao.loginidchk(id);
	}

	@Override
	public String signupempchk(String emp) {
		return dao.signupempchk(emp);
	}

}
