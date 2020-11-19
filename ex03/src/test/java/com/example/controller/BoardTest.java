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
		mapper.list(null);
	}

	@Test
	public void read() {
		mapper.read(2);
	}

	@Test
	public void insert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목111");
		vo.setContent("내용111");
		vo.setWriter("작성자111");
		mapper.insert(vo);
	}

	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(10);
		vo.setTitle("제목11");
		vo.setContent("내용11");
		vo.setWriter("작성자11");
		mapper.update(vo);
	}

	@Test
	public void delete() {
		mapper.delete(10);
	}
	@Test
	public void totalCount() {
		mapper.totalCount();
	}

}