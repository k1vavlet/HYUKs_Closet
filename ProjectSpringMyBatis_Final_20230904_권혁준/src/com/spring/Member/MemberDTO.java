package com.spring.Member;

import java.util.Date;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String date;
	private String hp;
	private String email;
	private String addr01;
	private String addr02;

	public MemberDTO() {
	}
	
	public MemberDTO(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public MemberDTO(String id, String pwd, String name, String date, String hp, String email, String addr01,String addr02) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.date = date;
		this.hp = hp;
		this.email = email;
		this.addr01 = addr01;
		this.addr02 = addr02;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr01() {
		return addr01;
	}

	public void setAddr01(String addr01) {
		this.addr01 = addr01;
	}

	public String getAddr02() {
		return addr02;
	}

	public void setAddr02(String addr02) {
		this.addr02 = addr02;
	}
}
