package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface ProductMapper {
	public void insert(ProductVO vo);

	public List<ProductVO> list(Criteria cri);

	public int totalCount(Criteria cri);

	public void insertImage(String image);

	public ProductVO read(int pCode);

	public List<String> getImage(int pCode);

	public void update(ProductVO vo);

	public void deleteImage(int pCode);

	public void updateImage(@Param("pCode") int pCode, @Param("image") String image);

	public void delete(int pCode);

}
