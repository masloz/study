package com.kh.third.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private static final long serialVersionUID = 1111111111L;
	
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String gender;
	private int age;
	private String phone;
	private String address;
	private Date enroll_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", gender=" + gender
				+ ", age=" + age + ", phone=" + phone + ", address=" + address + ", enroll_date=" + enroll_date + "]";
	}
	public Member(String id, String passwd, String name, String email, String gender, int age, String phone,
			String address, Date enroll_date) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
	}
	public Member() {}
	
	
}

