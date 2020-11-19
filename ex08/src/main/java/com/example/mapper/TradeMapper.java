package com.example.mapper;

import java.util.List;

import com.example.domain.TradeVO;

public interface TradeMapper {
	public List<TradeVO> list(String ano);

	public TradeVO read(int tid);
	
	public void insert(TradeVO vo);
}