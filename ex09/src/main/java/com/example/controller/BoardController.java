package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
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

	@RequestMapping(value = "/list")
	public void list(Model model, Criteria cri) {
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("list", mapper.list(cri));
		model.addAttribute("maker", maker);
	}

	@RequestMapping(value = "/insert")
	public void insert() {
	}

	@RequestMapping(value = "/read")
	public void read(int bno, Model model) {
		model.addAttribute("vo", mapper.read(bno));
	}

	@ResponseBody
	@RequestMapping(value = "/attach.json")
	public List<String> attach(int bno) {
		return mapper.getAttach(bno);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		service.insert(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo) {
		service.update(vo);
		return "redirect:list";
	}
}
