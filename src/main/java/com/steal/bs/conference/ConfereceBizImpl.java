package com.steal.bs.conference;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steal.bs.dto.ConferenceDto;
import com.steal.bs.dto.DepDto;

@Service
public class ConfereceBizImpl implements ConfereceBiz {

	@Autowired
	ConfereceDao dao;
	
	@Override
	public List<DepDto> selectList() {
		return dao.selectList();
	}

	@Override
	public List<ConferenceDto> selectRoomList(String id) {
		return dao.selectRoomList(id);
	}

	@Override
	public String selectRoomMember(String id) {
		return dao.selectRoomMember(id);
	}

	@Override
	public List<String> selectJoinedMember(String room) {
		return dao.selectJoinedMember(room);
	}

	@Override
	public int insertRoom(ConferenceDto dto) {
		if(dto.getUser2()==null) {
			dto.setUser2("");
			dto.setUser3("");
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser3()==null) {
			dto.setUser3("");
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser4()==null) {
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser5()==null) {
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser6()==null) {
			dto.setUser6("");
		}
		return dao.insertRoom(dto);
	}

	@Override
	public ConferenceDto checkRoom(String name) {
		return dao.checkRoom(name);
	}

}
