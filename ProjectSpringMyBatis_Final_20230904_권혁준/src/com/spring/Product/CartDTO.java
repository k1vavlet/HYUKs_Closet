package com.spring.Product;

public class CartDTO {
	private String cr_name;
	private String cr_img;
	private String cr_price;

	public CartDTO() {

	}

	public CartDTO(String cr_name, String cr_img, String cr_price) {
		super();
		this.cr_name = cr_name;
		this.cr_img = cr_img;
		this.cr_price = cr_price;
	}

	public String getCr_name() {
		return cr_name;
	}

	public void setCr_name(String cr_name) {
		this.cr_name = cr_name;
	}

	public String getCr_img() {
		return cr_img;
	}

	public void setCr_img(String cr_img) {
		this.cr_img = cr_img;
	}

	public String getCr_price() {
		return cr_price;
	}

	public void setCr_price(String cr_price) {
		this.cr_price = cr_price;
	}
}
