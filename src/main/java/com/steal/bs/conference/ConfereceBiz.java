package com.steal.bs.conference;

import java.util.List;

import com.steal.bs.dto.ConferenceDto;
import com.steal.bs.dto.DepDto;

public interface ConfereceBiz {

	public List<DepDto> selectList();

	List<ConferenceDto> selectRoomList(String id);

	String selectRoomMember(String id);

	public List<String> selectJoinedMember(String room);

	public int insertRoom(ConferenceDto dto);

	public ConferenceDto checkRoom(String name);
	
}
