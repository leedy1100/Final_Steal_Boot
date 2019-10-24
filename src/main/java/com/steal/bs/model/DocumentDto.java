package com.steal.bs.model;

import java.util.Date;

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
	public int getDoc_seq() {
		return doc_seq;
	}
	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDraft_date() {
		return draft_date;
	}
	public void setDraft_date(String draft_date) {
		this.draft_date = draft_date;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public Date getFsettle_date() {
		return fsettle_date;
	}
	public void setFsettle_date(Date fsettle_date) {
		this.fsettle_date = fsettle_date;
	}
	public String getCollaborator() {
		return collaborator;
	}
	public void setCollaborator(String collaborator) {
		this.collaborator = collaborator;
	}
	public String getSettlement() {
		return settlement;
	}
	public void setSettlement(String settlement) {
		this.settlement = settlement;
	}
	public String getDoc_location() {
		return doc_location;
	}
	public void setDoc_location(String doc_location) {
		this.doc_location = doc_location;
	}
	
	
}
