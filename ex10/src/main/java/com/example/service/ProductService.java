package com.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;

	@Transactional
	public void insert(ProductVO vo) {
		mapper.insert(vo);
		if (vo.getImages().size() > 0) {
			for (String image : vo.getImages()) {
				mapper.insertImage(image);
			}
		}
	}

	@Transactional
	public void update(ProductVO vo) {
		mapper.deleteImage(vo.getpCode());
		if (vo.getImages().size() > 0) {
			for (String image : vo.getImages()) {
				mapper.updateImage(vo.getpCode(), image);
			}
		}
		mapper.update(vo);
	}

	@Transactional
	public void delete(int pCode) {
		mapper.deleteImage(pCode);
		mapper.delete(pCode);
	}
}
