package com.ml.entity;

public class Address {

	private String id;
	private String street;
	private String city;
	private String state;
	private String country;
	private int pin;
/**
 * 	create table address(
			id varchar(100),
			street varchar(100),
			city varchar(100),
			state varchar(100),
			country varchar(100),
			pin int,
			primary key(id)
			);
			
			create trigger hms_t_before_insert_on_address
			before insert on address
			for each row
			set new.id = (select uuid());
 * */ 
	public Address() {
	}

	public Address(String id, String street, String city, String state, String country, int pin) {
		super();
		this.id = id;
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pin = pin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", city=" + city + ", state=" + state + ", country="
				+ country + ", pin=" + pin + "]";
	}

}
