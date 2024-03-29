package com.steal.bs.Document;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.steal.bs.dto.DocumentDto;

@Repository
public class DocumentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DocumentDto> selectList() {
		List<DocumentDto> list = null;
		try {
			list = sqlSession.selectList("document.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertDoc(DocumentDto dto) {
		int res = sqlSession.insert("document.insertDoc", dto);
		return res;
	}
	
	public DocumentDto docInfo(String title) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("title", title);
		DocumentDto dto = sqlSession.selectOne("document.docInfo", param);
		return dto;
	}
	
	public int initAlert() {
		int res = sqlSession.delete("document.initAlert");
		return res;
	}
	
}
