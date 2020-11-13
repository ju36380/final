package com.example.mapper;

import java.util.List;

import com.example.domain.MessageVO;

public interface MessageMapper {
	public void insert(MessageVO vo);
	
	public List<MessageVO> sendList(String sender);
	
	public void delete(int num);
	
	public List<MessageVO> receiveList(String receiver);
	
	public MessageVO read(int num);
	
	public void updateReadDate(int num);
}
