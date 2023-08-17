package com.petcheck.mapper;

import java.util.List;

import com.petcheck.entity.DiaryMapping;
import com.petcheck.entity.InviteVO;
import com.petcheck.entity.Memo;

public interface MemoMapper {
	
	public List<Memo> MemoList(String id);
	public void InsertMemo(Memo vo);
	public List<DiaryMapping> MyDiaryList(String id);
	public List<DiaryMapping> SharedDiaryList(String id);
	public void InsertMyDiary(DiaryMapping vo);
	public void InsertSharedDiary(DiaryMapping vo);
	public void InsertInvitation(InviteVO vo);
	public void DeleteInvitation(String id);
}
