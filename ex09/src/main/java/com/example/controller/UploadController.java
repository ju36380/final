package com.example.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	@Resource(name = "uploadPath") // 서블릿 context의 빈 id랑 일치시킴.
	private String path;
	String randomId;
	File target;

	@RequestMapping(value = "formUpload")
	public void formUpload() {

	}

	@RequestMapping(value = "ajaxUpload")
	public void ajaxUpload() {

	}

	@ResponseBody
	@RequestMapping(value = "ajaxUpload", method = RequestMethod.POST)
	public String ajaxUpload(MultipartFile file) throws Exception {
		randomId = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		target = new File(path, randomId);
		FileCopyUtils.copy(file.getBytes(), target);
		return randomId;
	}

	@ResponseBody
	@RequestMapping(value = "ajaxDelete", method = RequestMethod.POST)
	public void ajaxDelete(String fileName) {
		new File(path + "/" + fileName).delete();
	}

	@ResponseBody
	@RequestMapping(value = "displayFile")
	public byte[] displayFile(String fileName) throws Exception {
		FileInputStream fileIn = new FileInputStream(path + "/" + fileName);
		byte[] image =IOUtils.toByteArray(fileIn);
		fileIn.close();
		return image;
	}

	@RequestMapping(value = "formUpload", method = RequestMethod.POST)
	public void formUpload(MultipartFile file) throws Exception {
		randomId = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		target = new File(path, randomId);
		FileCopyUtils.copy(file.getBytes(), target);
	}

}
