package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	BoardMapper mapper;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(20);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("list", mapper.list(cri));
		model.addAttribute("maker", maker);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertValue(BoardVO vo) {
		mapper.insert(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Model model, int bno) {
		model.addAttribute("vo", mapper.read(bno));
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo) {
		mapper.update(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO vo) {
		mapper.delete(vo.getBno());
		return "redirect:list";
	}

}
