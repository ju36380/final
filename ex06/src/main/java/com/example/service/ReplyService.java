package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;

@Service
public class ReplyService {

	@Autowired
	ReplyMapper reply;

	@Autowired
	BoardMapper board;

	@Transactional
	public void insert(ReplyVO vo) {
		reply.insert(vo);
		board.updateReply(vo.getBno(), 1);
	}

	@Transactional
	public void delete(int rno) {
		ReplyVO vo = reply.read(rno);
		reply.delete(rno);
		board.updateReply(vo.getBno(), -1);
	}
}
