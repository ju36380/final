package com.example.domain;

import java.util.ArrayList;

public class ProductVO {
	private int pCode, price;
	private String pName, image;
	private ArrayList<String> images;

	public ArrayList<String> getImages() {
		return images;
	}

	public void setImages(ArrayList<String> images) {
		this.images = images;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	@Override
	public String toString() {
		return "ProductVO [pCode=" + pCode + ", price=" + price + ", pName=" + pName + ", image=" + image + ", images="
				+ images + "]";
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
