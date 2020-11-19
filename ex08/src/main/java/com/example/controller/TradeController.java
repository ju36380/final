package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.TradeVO;
import com.example.mapper.TradeMapper;
import com.example.service.AccountService;

@RestController
public class TradeController {
	@Autowired
	TradeMapper mapper;

	@Autowired
	AccountService service;

	@RequestMapping(value = "/tradeList")
	public List<TradeVO> list(String ano) {
		return mapper.list(ano);
	}

	@RequestMapping(value = "/trade", method = RequestMethod.POST)
	public void trade(String ano, String type, String tradeNo, double amount) {
		service.trade(ano, type, tradeNo, amount);
	}
}
