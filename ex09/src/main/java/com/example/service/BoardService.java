package com.example.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	BoardMapper mapper;

	@Transactional
	public void insert(BoardVO vo) {
		String[] files = vo.getFileName().split(" ");
		System.out.println(Arrays.toString(files));
		mapper.insert(vo);
		if (files.length > 0) {
			for (String fileName : files) {
				mapper.addAttach(fileName);
			}
		}
	}

	@Transactional
	public void update(BoardVO vo) {
		mapper.update(vo);
		mapper.deleteAttach(vo.getBno());
		String[] files = vo.getFileName().split(" ");
		if (files.length > 0) {
			for (String file : files) {
				mapper.replaceAttach(file, vo.getBno());
			}
		}
	}
}
