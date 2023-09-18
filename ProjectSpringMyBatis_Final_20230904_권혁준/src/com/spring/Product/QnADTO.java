package com.spring.Product;

public class QnADTO {
	private int qna_no;
	private String qna_pd_name;
	private String qna_pd_img;
	private String qna_title;
	private String qna_date;
	private String qna_content;
	private String qna_writer;

	public QnADTO() {
	}

	public QnADTO(int qna_no, String qna_pd_name, String qna_pd_img, String qna_title, String qna_date,
			String qna_content, String qna_writer) {
		super();
		this.qna_no = qna_no;
		this.qna_pd_name = qna_pd_name;
		this.qna_pd_img = qna_pd_img;
		this.qna_title = qna_title;
		this.qna_date = qna_date;
		this.qna_content = qna_content;
		this.qna_writer = qna_writer;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_pd_name() {
		return qna_pd_name;
	}

	public void setQna_pd_name(String qna_pd_name) {
		this.qna_pd_name = qna_pd_name;
	}

	public String getQna_pd_img() {
		return qna_pd_img;
	}

	public void setQna_pd_img(String qna_pd_img) {
		this.qna_pd_img = qna_pd_img;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

}
