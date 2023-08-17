package com.petcheck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petcheck.entity.Diary;
import com.petcheck.entity.DiaryMapping;
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
	public List<Memo> ajaxMemoList(String id) {
		List<Memo> list = mapper2.MemoList(id);
		return list;
	}
	
	@RequestMapping("/ajaxMemoInsert.do")
	public void ajaxMemoInsert(Memo vo) {
		mapper2.InsertMemo(vo);
		return;
	}
	
	@RequestMapping("/ajaxDiaryInsert.do")
	public void ajaxDiaryInsert(DiaryMapping vo) {
		System.out.println(vo);
		mapper2.InsertDiary(vo);
		return;
	}
	
	@RequestMapping("/ajaxMyDiaryList.do")
	public List<DiaryMapping> ajaxMyDiaryList(String id) {
		List<DiaryMapping> list = mapper2.MyDiaryList(id);
		return list;
	}
	
	@RequestMapping("/ajaxSharedDiaryList.do")
	public List<DiaryMapping> ajaxSharedDiaryList(String id) {
		List<DiaryMapping> list = mapper2.SharedDiaryList(id);
		return list;
	}

}
