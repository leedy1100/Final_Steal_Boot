package com.steal.bs.conference;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steal.bs.dto.ConferenceDto;
import com.steal.bs.dto.DepDto;

@Repository
public class ConfereceDaoImpl implements ConfereceDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DepDto> selectList() {

		List<DepDto> list = new ArrayList<DepDto>();

		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("SELECT LIST ERROR");
			e.printStackTrace();
		}

		return list;
		
	}

	@Override
	public List<ConferenceDto> selectRoomList(String id) {
		List<ConferenceDto> list = new ArrayList<ConferenceDto>();

		try {
			list = sqlSession.selectList(namespace + "selectRoomList", id);
		} catch (Exception e) {
			System.out.println("selectRoomList ERROR");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public String selectRoomMember(String id) {
		String roomname = null;

		try {
			roomname = sqlSession.selectOne(namespace + "selectRoomMember", id);
		} catch (Exception e) {
			System.out.println("selectRoomMember ERROR");
			e.printStackTrace();
		}

		return roomname;
	}

	@Override
	public List<String> selectJoinedMember(String room) {
		List<String> list = new ArrayList<String>();

		try {
			list = sqlSession.selectList(namespace + "selectJoinedMember", room);
		} catch (Exception e) {
			System.out.println("selectJoinedMember ERROR");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insertRoom(ConferenceDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insertRoom", dto);
		} catch (Exception e) {
			System.out.println("insertRoom ERROR");
			e.printStackTrace();
		}
		return res;
		
	}

	@Override
	public ConferenceDto checkRoom(String name) {
		
		ConferenceDto dto = null;
		
		try {
			dto = sqlSession.selectOne(namespace+"getRoom", name);
		} catch (Exception e) {
			System.out.println("getRoom ERROR");
			e.printStackTrace();
		}
	
		return dto;
		
	}

}
