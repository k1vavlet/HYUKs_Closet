package com.spring.Notice;

public class EventDTO {
	private int evt_no;
	private String evt_title;
	private String evt_content;
	private String evt_dating;
	private String evt_writer;

	public EventDTO() {

	}

	public EventDTO(int evt_no, String evt_title, String evt_content, String evt_dating, String evt_writer) {
		super();
		this.evt_no = evt_no;
		this.evt_title = evt_title;
		this.evt_content = evt_content;
		this.evt_dating = evt_dating;
		this.evt_writer = evt_writer;
	}

	public int getEvt_no() {
		return evt_no;
	}

	public void setEvt_no(int evt_no) {
		this.evt_no = evt_no;
	}

	public String getEvt_title() {
		return evt_title;
	}

	public void setEvt_title(String evt_title) {
		this.evt_title = evt_title;
	}

	public String getEvt_content() {
		return evt_content;
	}

	public void setEvt_content(String evt_content) {
		this.evt_content = evt_content;
	}

	public String getEvt_dating() {
		return evt_dating;
	}

	public void setEvt_dating(String evt_dating) {
		this.evt_dating = evt_dating;
	}

	public String getEvt_writer() {
		return evt_writer;
	}

	public void setEvt_writer(String evt_writer) {
		this.evt_writer = evt_writer;
	}

}
