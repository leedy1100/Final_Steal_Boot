package com.steal.bs.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MainDto> selectList() {

		List<MainDto> list = new ArrayList<MainDto>();

		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("SELECT LIST ERROR");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public MainDto selectOne(String id) {

		MainDto userdto = null;

		try {
			userdto = sqlSession.selectOne(namespace + "selectOne", id);
		} catch (Exception e) {
			System.out.println("SELECT ONE ERROR");
			e.printStackTrace();
		}

		return userdto;
	}

	@Override
	public int insert(MainDto dto) {

		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("INSERT ERROR");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(MainDto dto) {

		int res = 0;
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			System.out.println("UPDATE ERROR");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int seq) {

		int res = 0;
		try {
			res = sqlSession.delete(namespace + "delete", seq);
		} catch (Exception e) {
			System.out.println("DELETE ERROR");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public String loginidchk(String id) {

		String resurtid = null;
		try {
			resurtid = sqlSession.selectOne(namespace + "loginidchk", id);
		} catch (Exception e) {
			System.out.println("loginidchk ERROR");
			e.printStackTrace();
		}

		return resurtid;
	}

	@Override
	public String signupempchk(String emp) {

		String resurtemp = null;
		try {
			resurtemp = sqlSession.selectOne(namespace + "signupempchk", emp);
		} catch (Exception e) {
			System.out.println("signupempchk ERROR");
			e.printStackTrace();
		}

		return resurtemp;
	}

	@Override
	public String updatepwchk(String seq) {
		String resurtpw = null;
		try {
			resurtpw = sqlSession.selectOne(namespace + "loginpwchk", seq);
		} catch (Exception e) {
			System.out.println("loginpwchk ERROR");
			e.printStackTrace();
		}

		return resurtpw;
	}

	@Override
	public String idsearch(MainDto dto) {

		String resurtid = null;
		try {
			resurtid = sqlSession.selectOne(namespace + "idsearch", dto);
		} catch (Exception e) {
			System.out.println("idsearch ERROR");
			e.printStackTrace();
		}

		return resurtid;
	}

	@Override
	public String pwsearch(MainDto dto) {

		String resurtid = null;
		try {
			resurtid = sqlSession.selectOne(namespace + "pwsearch", dto);
		} catch (Exception e) {
			System.out.println("ipwsearch ERROR");
			e.printStackTrace();
		}

		return resurtid;
	}

	@Override
	public int empUpdate(MainDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(namespace + "empUpdate", dto);
		} catch (Exception e) {
			System.out.println("EMPUPDATE ERROR");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<EmpDto> empList() {

		List<EmpDto> list = new ArrayList<EmpDto>();
		try {
			list = sqlSession.selectList(namespace + "empList");
		} catch (Exception e) {
			System.out.println("emplist error");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int empInsert(EmpDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(namespace + "empInsert", dto);
		} catch (Exception e) {
			System.out.println("empInsert error");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int empDelete(int emp_no) {

		int res = 0;
		try {
			res = sqlSession.delete(namespace + "empDelete", emp_no);
		} catch (Exception e) {
			System.out.println("empDelete error");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int empNameUpdate(String name, String emp_no) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("emp_no", emp_no);
		
		
		try {
			res = sqlSession.update(namespace+"empNameUpdate", map);
		} catch (Exception e) {
			System.out.println("empNameUpdate error");
			e.printStackTrace();
		}
		return res;
	}

}
