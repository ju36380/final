package com.example.mapper;

import java.util.List;

import com.example.domain.AddressVO;

public interface AddressMapper {

	public List<AddressVO> list();
	
	public void insert(AddressVO vo);
	
	public AddressVO read(int ano);

	public void update(AddressVO vo);
	
	public void delete(int ano);
}
