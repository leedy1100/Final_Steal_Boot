package com.steal.bs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
