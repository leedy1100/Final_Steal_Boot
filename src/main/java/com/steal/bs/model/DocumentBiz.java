package com.steal.bs.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentBiz {

	@Autowired
	DocumentDao dao;
	
	public List<DocumentDto> selectList() {
		return dao.selectList();
	}
	
	public int insert(DocumentDto dto) {
		return dao.insertDoc(dto);
	}
	
	public DocumentDto docInfo(String title) {
		return dao.docInfo(title);
	}
	
}
