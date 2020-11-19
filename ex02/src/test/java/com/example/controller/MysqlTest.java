package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;

@RunWith(SpringJUnit4ClassRunner.class) // ���� SpringJUnit4ClassRunner.class
										// import�Ѵ�.
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
		vo.setName("����");
		vo.setTel("010-5671-6204");
		vo.setAddress("����");
		mapper.insert(vo);
	}

	@Test
	public void update() {
		vo.setName("��");
		vo.setTel("010-5671-6204");
		vo.setAddress("����");
		vo.setAno(2);
		mapper.update(vo);
	}

	@Test
	public void delete() {
		mapper.delete(2);
	}
}
