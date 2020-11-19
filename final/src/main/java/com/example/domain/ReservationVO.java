package com.example.domain;

import java.util.Date;

public class ReservationVO {
	private String bus_code, terminal_code, platform_code, schedule_start, user_id;
	private Date reser_date;
	private int seat_num;

	public String getBus_code() {
		return bus_code;
	}

	public void setBus_code(String bus_code) {
		this.bus_code = bus_code;
	}

	public String getTerminal_code() {
		return terminal_code;
	}

	public void setTerminal_code(String terminal_code) {
		this.terminal_code = terminal_code;
	}

	public String getPlatform_code() {
		return platform_code;
	}

	public void setPlatform_code(String platform_code) {
		this.platform_code = platform_code;
	}

	public String getSchedule_start() {
		return schedule_start;
	}

	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getReser_date() {
		return reser_date;
	}

	public void setReser_date(Date reser_date) {
		this.reser_date = reser_date;
	}

	public int getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}

	@Override
	public String toString() {
		return "ReservationVO [bus_code=" + bus_code + ", terminal_code=" + terminal_code + ", platform_code="
				+ platform_code + ", schedule_start=" + schedule_start + ", user_id=" + user_id + ", reser_date="
				+ reser_date + ", seat_num=" + seat_num + "]";
	}

}
