package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);

	public BoardVO read(int bno);

	public void insert(BoardVO vo);

	public void update(BoardVO vo);

	public void delete(int bno);

	public int totalCount(Criteria cri);

	public void addAttach(String fileName);

	public List<String> getAttach(int bno);

	public void deleteAttach(int bno);

	public void replaceAttach(@Param("fileName") String fileName, @Param("bno") int bno);
}
