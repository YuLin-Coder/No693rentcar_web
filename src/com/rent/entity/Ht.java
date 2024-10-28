package com.rent.entity;

public class Ht {
	
	private Integer id;
	private String htbh;
	private Integer uid;
	private String phone;
	private Integer cid;
	private Integer eid;
	private Integer oid;
	private String 	qysj;
	private String 	htwj;
	private User user;
	private Car car;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHtbh() {
		return htbh;
	}
	public void setHtbh(String htbh) {
		this.htbh = htbh;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getQysj() {
		return qysj;
	}
	public void setQysj(String qysj) {
		this.qysj = qysj;
	}
	public String getHtwj() {
		return htwj;
	}
	public void setHtwj(String htwj) {
		this.htwj = htwj;
	}


}
