package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class) // ���� SpringJUnit4ClassRunner.class
										// import�Ѵ�.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class BoardTest {
	@Autowired
	private BoardMapper mapper;

	@Test
	public void list() {
		mapper.list();
	}

	@Test
	public void insert() {
		BoardVO vo = new BoardVO();
		vo.setWriter("�ۼ���6");
		vo.setContent("����6");
		vo.setTitle("����6");
		mapper.insert(vo);
	}

	@Test
	public void read() {
		int bno = 7;
		mapper.read(bno);
	}

	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setWriter("�ۼ���10");
		vo.setContent("����10");
		vo.setTitle("����10");
		vo.setBno(2);
		mapper.update(vo);
	}

	@Test
	public void delete() {
		mapper.delete(14);
	}

}