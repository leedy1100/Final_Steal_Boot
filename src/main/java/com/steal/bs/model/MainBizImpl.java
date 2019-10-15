package com.steal.bs.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MainBizImpl implements MainBiz, UserDetailsService {

	@Autowired
	private MainDao dao;
	@Autowired 
	PasswordEncoder passwordEncoder;
	
	@Override
	public List<MainDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public MainDto selectOne(String id){
		return dao.selectOne(id);
	}

	@Override
	public int insert(MainDto dto) {
		
		dto.setMain_password(passwordEncoder.encode(dto.getMain_password()));
		
		return dao.insert(dto);
	}

	@Override
	public int update(MainDto dto) {
		
		dto.setMain_password(passwordEncoder.encode(dto.getMain_password()));
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

	@Override
	public int empUpdate(MainDto dto) {
		return dao.empUpdate(dto);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MainDto dto = dao.selectOne(username);
		if(dto == null) {
			System.out.println("loadUserByUsername : not existed user");
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		return dto;
	}

	@Override
	public List<EmpDto> empList() {
		return dao.empList();
	}

	@Override
	public int empInsert(EmpDto dto) {
		return dao.empInsert(dto);
	}

	@Override
	public int empDelete(int emp_no) {
		return dao.empDelete(emp_no);
	}

	@Override
	public int empNameUpdate(String name, String emp_no) {
		return dao.empNameUpdate(name, emp_no);
	}


}
