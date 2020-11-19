package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;

@RunWith(SpringJUnit4ClassRunner.class) // 먼저 SpringJUnit4ClassRunner.class
										// import한다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class MysqlTest {
	@Autowired
	private AddressMapper mapper;

	AddressVO vo = new AddressVO();

	@Test
	public void list() {
		mapper.list();
	}

	@Test
	public void read() {
		mapper.read(1);
	}
	
	@Test
	public void insert() {
		vo.setName("행준");
		vo.setTel("010-5671-6204");
		vo.setAddress("서울");
		mapper.insert(vo);
	}

	@Test
	public void update() {
		vo.setName("준");
		vo.setTel("010-5671-6204");
		vo.setAddress("서울");
		vo.setAno(2);
		mapper.update(vo);
	}

	@Test
	public void delete() {
		mapper.delete(2);
	}
}
