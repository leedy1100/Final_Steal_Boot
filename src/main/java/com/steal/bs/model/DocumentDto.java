package com.steal.bs.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentDto {
	private int doc_seq;         // 문서번호
	private String title;        // 문서제목
	private String writer;       // 작성자
	private String content;      // 내용
	private String draft_date;   // 기안일
	private String deadline; // 결재기한
	private Date fsettle_date;   // 최종결재일
	private String collaborator; // 협조자
	private String settlement;   // 결재자
	private String doc_location; // 첨부파일 위치
	
}
