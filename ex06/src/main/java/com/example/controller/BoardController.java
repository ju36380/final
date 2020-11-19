package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardMapper mapper;

	@Autowired
	BoardService service;

	@RequestMapping("/reply")
	public void reply() {

	}

	@RequestMapping("/list")
	public void list(Model model, Criteria cri) {
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(cri));

		model.addAttribute("maker", maker);
		model.addAttribute("list", mapper.list(cri));
	}

	@RequestMapping("/read")
	public void read(Model model, int bno) {
		model.addAttribute("vo", service.read(bno));
	}
}