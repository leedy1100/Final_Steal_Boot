package com.steal.bs.dto;

public class CalDto {
	
	private int id;
	private int _id;
	private String title;
	private String eventStart;
	private String eventEnd;
	private String description;
	private String eventType;
	private String bgColor;
	private String textColor;
	private int alram;
	private char allDay;
	
	public CalDto() { }
	public CalDto(int _id, String title, String eventSstart,  String eventEnd, String description,
			 String eventType,  String bgColor, String textColor, int alram, char allDay) {
		this.id = _id;
		this._id = _id;
		this.title = title;
		this.eventStart = eventSstart;
		this.eventEnd = eventEnd;
		this.description = description;
		this.eventType = eventType;
		this.bgColor = bgColor;
		this.textColor = textColor;
		this.alram = alram;
		this.allDay = allDay;
	}

	public int get_id() {
		return _id;
	}
	public int getId() {
		return id;
	}

	public void set_id(int _id) {
		this._id = _id;
		this.id = _id;
	}

	public void setId(int id) {
		this._id = id;
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return eventStart;
	}

	public void setStart(String eventStart) {
		this.eventStart = eventStart;
	}

	public String getEnd() {
		return eventEnd;
	}

	public void setEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return eventType;
	}

	public void setType(String eventType) {
		this.eventType = eventType;
	}

	public String getBackgroundColor() {
		return bgColor;
	}

	public void setBackgroundColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
/*
	public int getAlram() {
		return alram;
	}

	public void setAlram(int alram) {
		this.alram = alram;
	}

	public boolean getAllDay() {
		if (allDay == 'Y') return true;
		else return false;
//		return allDay;
	}

	public char setAllDay(boolean allDay) {
		if (allDay == true) return 'Y';
		else return 'N';
//		this.allDay = allDay;
	}
*/
	@Override
	public String toString() {
		return "calDto [id=" + id + ", title=" + title + ", eventStart=" + eventStart + ", eventEnd=" + eventEnd
				+ ", description=" + description + ", eventType=" + eventType + ", bgColor=" + bgColor + ", textColor="
				+ textColor + ", alram=" + alram + ", allDay=" + allDay + "]";
	}
	

}
