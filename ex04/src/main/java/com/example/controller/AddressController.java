package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.AddressMapper;

@Controller
public class AddressController {
	
	@Autowired
	AddressMapper mapper;
	
	@RequestMapping(value= "/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		PageMaker maker= new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("maker", maker);
		model.addAttribute("list", mapper.list(cri));
	}
}
