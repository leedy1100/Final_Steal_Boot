package com.steal.bs.Cal;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steal.bs.dto.CalDto;


@Repository
public class CalDaoImpl implements CalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CalDto> selectList(String start) {
		
		List<CalDto> list = new ArrayList<CalDto>();
		//System.out.println("dao start:"+start);
		try {
			list = sqlSession.selectList(namespace+"selectEventList", start);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error 04:selectEventList");
		}
		return list;
	}

	@Override
	public int insertEvent(CalDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace+"insertEvent", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error 04:insertEvent");
		}	

		return res;
	}

	@Override
	public int updateEvent(CalDto dto) {

		int res = 0;
		System.out.println("id:"+dto.getId());
		try {
			res = sqlSession.update(namespace+"updateEvent", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error 04:updateEvent");
		}	

		return res;
	}

	@Override
	public int deleteEvent(int seq) {

		int res = 0;
	
		try {
			res = sqlSession.delete(namespace+"deleteEvent", seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error 04:deleteEvent");
		}	

		return res;
	}
	

}
