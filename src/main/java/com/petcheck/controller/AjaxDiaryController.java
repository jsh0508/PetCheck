package com.petcheck.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petcheck.entity.Diary;
import com.petcheck.mapper.DiaryMapper;

@RestController
public class AjaxDiaryController {
	
	@Autowired
	private DiaryMapper mapper;
	
	@RequestMapping("/ajaxInsert.do")
	public void ajaxInsert(Diary vo) {
		mapper.InsertCalendar(vo);
		return;
	}
	
	@RequestMapping("/ajaxDelete.do")
	public void ajaxDelete(String cal_key) {
		System.out.println("cal_key"+cal_key);
		System.out.println("hi");
		mapper.DeleteCalendar(cal_key);
		return;
	}

}
