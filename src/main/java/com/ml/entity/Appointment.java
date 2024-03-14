package com.ml.entity;

import java.time.LocalDate;

public class Appointment {

	private long id;
	private int userId;		//userId
	private String age;
	private Gender gender;	//enum
	private Disease disease; //enum
	private LocalDate doreg;
	private LocalDate doapp;
	private int doctorId;		//doctorId
	private int patientNumber;
	private String status;
	private String address; //addressId
	private String healthCard;
/**
	create table appointments(
			id varchar(100) not null primary key default random,
			user int,
			age int,
			gender enum('MALE', 'FEMALE', 'OTHERS'),
			disease varchar(100),
			regDate date,
			aptDate date,
			doctor int,
			patientNumber int,
			status varchar(50),
			address varchar(100),
			file varchar(200),
			foreign key(user) references user(id),
			foreign key(doctor) references doctor(id),
			foreign key(address) references address(id)
			);
			
			create trigger hms_t_before_insert_on_appointments
			before insert on appointments
			for each row
			set new.id = (select uuid());
*/
	public Appointment() {

	}

	public Appointment(int userId, Gender gender, Disease disease, LocalDate doreg, LocalDate doapp, int doctorId,
			int patientNumber, String status, String address) {
		super();
		this.userId = userId;
		this.gender = gender;
		this.disease = disease;
		this.doreg = doreg;
		this.doapp = doapp;
		this.doctorId = doctorId;
		this.patientNumber = patientNumber;
		this.status = status;
		this.address = address;
	}

	public Appointment(long id, int userId, String age, Gender gender, Disease disease, LocalDate doreg, LocalDate doapp,
			int doctorId, int patientNumber, String status, String address, String healthCard) {
		super();
		this.id = id;
		this.userId = userId;
		this.age = age;
		this.gender = gender;
		this.disease = disease;
		this.doreg = doreg;
		this.doapp = doapp;
		this.doctorId = doctorId;
		this.patientNumber = patientNumber;
		this.status = status;
		this.address = address;
		this.healthCard = healthCard;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Disease getDisease() {
		return disease;
	}

	public void setDisease(Disease disease) {
		this.disease = disease;
	}

	public LocalDate getDoreg() {
		return doreg;
	}

	public void setDoreg(LocalDate doreg) {
		this.doreg = doreg;
	}

	public LocalDate getDoapp() {
		return doapp;
	}

	public void setDoapp(LocalDate doapp) {
		this.doapp = doapp;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatientNumber() {
		return patientNumber;
	}

	public void setPatientNumber(int patientNumber) {
		this.patientNumber = patientNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String string) {
		this.address = string;
	}

	public String getHealthCard() {
		return healthCard;
	}

	public void setHealthCard(String file) {
		this.healthCard = file;
	}

	@Override
	public String toString() {
		return "Appointment [id=" + id + ", userId=" + userId + ", age=" + age + ", gender=" + gender + ", disease="
				+ disease + ", doreg=" + doreg + ", doapp=" + doapp + ", doctorId=" + doctorId + ", patientNumber="
				+ patientNumber + ", status=" + status + ", address=" + address + ", healthCard=" + healthCard + "]";
	}

}
