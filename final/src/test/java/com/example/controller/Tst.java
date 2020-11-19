package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.DriverVO;
import com.example.mapper_oracle.DriverMapper;
import com.example.mapper_oracle.PlatformMapper;

@RunWith(SpringJUnit4ClassRunner.class) // ���� SpringJUnit4ClassRunner.class
										// import�Ѵ�.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class Tst {
	@Autowired
	PlatformMapper mapper;

	@Autowired
	DriverMapper dMapper;

	@Test
	public void run() {
		DriverVO vo = new DriverVO();
		vo.setCompany_code("00000007");
		for (int i = 176, count = 1; count <= 25; i++, count++) {
			vo.setDriver_code(String.format("%08d", i));
			vo.setDriver_name("Driver_" + vo.getDriver_code());
			dMapper.insert(vo);
		}
	}
}
