package com.example.domain;

public class ScheduleVO {
	private String terminal_code, platform_code, schedule_start, schedule_driver;
	private int schedule_price;

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

	public String getSchedule_driver() {
		return schedule_driver;
	}

	public void setSchedule_driver(String schedule_driver) {
		this.schedule_driver = schedule_driver;
	}

	public int getSchedule_price() {
		return schedule_price;
	}

	public void setSchedule_price(int schedule_price) {
		this.schedule_price = schedule_price;
	}

	@Override
	public String toString() {
		return "ScheduleVO [terminal_code=" + terminal_code + ", platform_code=" + platform_code + ", schedule_start="
				+ schedule_start + ", schedule_driver=" + schedule_driver + ", schedule_price=" + schedule_price + "]";
	}

}
