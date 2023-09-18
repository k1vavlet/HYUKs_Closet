package com.spring.Notice;

public class NoticeDTO {
	private int nt_no;
	private String nt_title;
	private String nt_date;
	private String nt_content;
	private String nt_writer;

	public NoticeDTO() {

	}

	public NoticeDTO(int nt_no, String nt_title, String nt_date, String nt_content, String nt_writer) {
		super();
		this.nt_no = nt_no;
		this.nt_title = nt_title;
		this.nt_date = nt_date;
		this.nt_content = nt_content;
		this.nt_writer = nt_writer;
	}

	public int getNt_no() {
		return nt_no;
	}

	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_date() {
		return nt_date;
	}

	public void setNt_date(String nt_date) {
		this.nt_date = nt_date;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public String getNt_writer() {
		return nt_writer;
	}

	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}
}
