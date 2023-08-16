package com.petcheck.mapper;

import java.util.List;

import com.petcheck.entity.Memo;

public interface MemoMapper {
	
	public List<Memo> MemoList(int idx);
	public void InsertMemo(Memo vo);

}
