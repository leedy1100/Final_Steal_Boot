package com.steal.bs.Cal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steal.bs.dto.CalDto;


@Service
public class CalBizImpl implements CalBiz{

	@Autowired
	private CalDao dao;
	
	@Override
	public int insertEvent(CalDto dto) {
		return dao.insertEvent(dto);		
	}

	@Override
	public int updateEvent(CalDto dto) {
		return dao.updateEvent(dto);
		
	}

	@Override
	public int deleteEvent(int seq) {
		return dao.deleteEvent(seq);
		
	}

	@Override
	public List<CalDto> selectList(String start) {
		return dao.selectList(start.substring(0,7));
	}


}
