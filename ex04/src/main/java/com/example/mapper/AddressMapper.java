package com.example.mapper;

import java.util.List;

import com.example.domain.AddressVO;
import com.example.domain.Criteria;

public interface AddressMapper {
	public List<AddressVO> list(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public AddressVO read(int ano);
	
	public void delete(int ano);
	
	public void insert(AddressVO vo);
	
	public void update(AddressVO vo);
}
