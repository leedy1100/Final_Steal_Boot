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
		char sex = dto.getMain_sex();
		switch(sex){
			case '남':
				sex='M';
				break;
			case '여':
				sex='F';
				break;
			default :
				sex='X';
		}
		dto.setMain_sex(sex);
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

	@Override
	public String updatepwchk(String seq) {
		return dao.updatepwchk(seq);
	}

	@Override
	public String idsearch(MainDto dto) {
		return dao.idsearch(dto);
	}

	@Override
	public String pwsearch(MainDto dto) {
		return dao.pwsearch(dto);
	}

}
