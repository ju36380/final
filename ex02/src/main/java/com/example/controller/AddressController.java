package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;

@Controller
public class AddressController {
	@Autowired // 왼쪽(인터페이스)에 있는 값을 오른쪽 객체에 저장.
	AddressMapper mapper;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("list", mapper.list());
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertValue(AddressVO vo) {
		mapper.insert(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/read")
	public void read(int ano, Model model) {
		model.addAttribute("vo", mapper.read(ano));
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(AddressVO vo) {
		mapper.update(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int ano) {
		mapper.delete(ano);
		return "redirect:list";
	}
}