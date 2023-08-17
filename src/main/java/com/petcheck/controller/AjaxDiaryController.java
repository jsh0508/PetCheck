package com.petcheck.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.petcheck.entity.Diary;
import com.petcheck.entity.Memo;
import com.petcheck.mapper.DiaryMapper;
import com.petcheck.mapper.MemoMapper;

@RestController
public class AjaxDiaryController {
	
	@Autowired
	private DiaryMapper mapper;
	@Autowired
	private MemoMapper mapper2;
	
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
	
	@RequestMapping("/ajaxMemoList.do")
	public List<Memo> ajaxMemoList(int idx) {
		List<Memo> list = mapper2.MemoList(idx);
		return list;
	}
	
	
	@RequestMapping("/ajaxMemoInsert.do")
	public void ajaxMemoInsert(Memo vo) {
		mapper2.InsertMemo(vo);
		return;
	}
	
	

}
