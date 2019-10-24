package com.steal.bs.model;

import java.util.List;

import com.steal.bs.dto.CalDto;


public interface CalDao {
	
	String namespace="calendar.";
	
	public List<CalDto> selectList(String start);
	public int insertEvent(CalDto dto);
	public int updateEvent(CalDto dto);
	public int deleteEvent(int seq);
}
