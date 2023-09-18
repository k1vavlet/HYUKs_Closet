package com.spring.Product;

public class ReviewDTO {
	private int rv_no;
	private String rv_pd_name;
	private String rv_pd_img;
	private String rv_title;
	private String rv_date;
	private String rv_content;
	private String rv_writer;

	public ReviewDTO() {

	}
	
	public ReviewDTO(int rv_no, String rv_title, String rv_content, String rv_writer) {
		super();
		this.rv_no = rv_no;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_writer = rv_writer;
	}
	
	public ReviewDTO(String rv_pd_name, String rv_pd_img, String rv_title, String rv_content, String rv_writer) {
		super();
		this.rv_pd_name = rv_pd_name;
		this.rv_pd_img = rv_pd_img;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_writer = rv_writer;
	}

	public ReviewDTO(int rv_no, String rv_pd_name, String rv_pd_img, String rv_title, String rv_date, String rv_content,
			String rv_writer) {
		super();
		this.rv_no = rv_no;
		this.rv_pd_name = rv_pd_name;
		this.rv_pd_img = rv_pd_img;
		this.rv_title = rv_title;
		this.rv_date = rv_date;
		this.rv_content = rv_content;
		this.rv_writer = rv_writer;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_pd_name() {
		return rv_pd_name;
	}

	public void setRv_pd_name(String rv_pd_name) {
		this.rv_pd_name = rv_pd_name;
	}

	public String getRv_pd_img() {
		return rv_pd_img;
	}

	public void setRv_pd_img(String rv_pd_img) {
		this.rv_pd_img = rv_pd_img;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_date() {
		return rv_date;
	}

	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public String getRv_writer() {
		return rv_writer;
	}

	public void setRv_writer(String rv_writer) {
		this.rv_writer = rv_writer;
	}

}
