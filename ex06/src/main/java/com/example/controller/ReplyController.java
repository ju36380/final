package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;
import com.example.service.ReplyService;

@RestController
@RequestMapping(value = "/reply")
public class ReplyController {

	@Autowired
	ReplyMapper mapper;

	@Autowired
	ReplyService service;

	@RequestMapping(value = "/list")
	public Map<String, Object> list(int bno, int page) {

		Map<String, Object> map = new HashMap<>();
		Criteria cri = new Criteria();
		cri.setPage(page);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(bno));
		int total = maker.getTotalCount(), perPage = maker.getCri().getPerPageNum(),
				last = total % perPage == 0 ? total / perPage : total / perPage + 1;

		map.put("last", last);
		map.put("maker", maker);
		map.put("list", mapper.list(cri, bno));

		return map;
	}

	@RequestMapping(value = "/delete")
	public void delete(int rno) {
		service.delete(rno);
	}

	@RequestMapping(value = "/insert")
	public void insert(ReplyVO vo) {
		service.insert(vo);
	}
}
