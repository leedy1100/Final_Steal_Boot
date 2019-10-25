package com.steal.bs.Cal;

import java.util.List;

import com.steal.bs.dto.CalDto;


public interface CalBiz {

	public List<CalDto> selectList(String start);
	public int insertEvent(CalDto dto);
	public int deleteEvent(int seq);
	public int updateEvent(CalDto dto);
}
