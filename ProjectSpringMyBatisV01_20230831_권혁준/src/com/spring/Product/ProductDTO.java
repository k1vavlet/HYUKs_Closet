package com.spring.Product;

public class ProductDTO {
	private String snum;
	private String name;
	private String price;
	private int many;
	private String img;
	private String info_img;
	private String category;

	public ProductDTO() {

	}

	public ProductDTO(String snum, String name, String price, int many, String img, String info_img, String category) {
		super();
		this.snum = snum;
		this.name = name;
		this.price = price;
		this.many = many;
		this.img = img;
		this.info_img = info_img;
		this.category = category;
	}

	public String getSnum() {
		return snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getMany() {
		return many;
	}

	public void setMany(int many) {
		this.many = many;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo_img() {
		return info_img;
	}

	public void setInfo_img(String info_img) {
		this.info_img = info_img;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
