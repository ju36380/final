package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.mapper.AddressMapper;
import com.example.mapper.MysqlMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class AddressTest {
	@Autowired
	private AddressMapper mapper;

	@Test
	public void list() {
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		cri.setSearchType("name");
		cri.setKeyword("gus");
		mapper.list(cri);
	}

	@Test
	public void totalCount() {
		Criteria cri = new Criteria();
		cri.setSearchType("name");
		cri.setKeyword("gus");
		mapper.totalCount(cri);
	}

}
