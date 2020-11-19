package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	BoardMapper mapper;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, Criteria cri) {
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("maker", maker);
		model.addAttribute("list", mapper.list(cri));
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Model model, int bno) {
		model.addAttribute("vo", mapper.read(bno));
	}
}