package com.petcheck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petcheck.entity.Diary;
import com.petcheck.entity.DiaryMapping;
import com.petcheck.entity.InviteVO;
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
		mapper2.InsertMyDiary(vo);
		return;
	}
	
	@RequestMapping("/ajaxMemoDelete.do")
	public void ajaxMemoDelete(String title) {
		mapper2.DeleteMemo(title);
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
	
	@RequestMapping("/ajaxInvitationInsert.do")
	public void ajaxInvitationInsert(InviteVO vo) {
		System.out.println("ajaxInvitation -->"+ vo);
		mapper2.InsertInvitation(vo);
		return;
	}
	
	@RequestMapping("/ajaxInvitationYes.do")
	public void ajaxInvitationYes(DiaryMapping vo) {
		System.out.println("ajaxInvite Yes -->" + vo);
		System.out.println(vo.getDiary_key());
		mapper2.DeleteInvitation(vo.getDiary_key());
		mapper2.InsertSharedDiary(vo);
	}
	
	@RequestMapping("/ajaxInvitationNo.do")
	public void ajaxInvitationNo(DiaryMapping vo) {
		System.out.println("ajaxInvite NO -->" + vo);
		mapper2.DeleteInvitation(vo.getDiary_key());
	}
	
	@RequestMapping("/ajaxIsShared.do")
	public boolean ajaxIsShared(DiaryMapping vo) {
		System.out.println(vo);
		System.out.println("ajaxShared -->" + vo);
		boolean check;
		List<String> res = mapper2.isShared(vo);
		if (res.size() == 0) {
			check = false; // 공유된 다이어리가 아님
		} else {
			check = true; // 공유된 다이어리가 맞음
		}
		return check;
	}
	
	@RequestMapping("/ajaxIsInvitation.do")
	public boolean ajaxIsInvitation(InviteVO vo) {
		boolean check;
		String res = mapper2.isInvitation(vo);
		if (res == null) {
			check = true; // 초대를 보내지 않은 상태
		} else {
			check = false; // 이미 초대를 보낸 상태
		}
		return check;
	}
}
