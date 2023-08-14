package com.petcheck.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcheck.entity.Diary;


public interface DiaryMapper {
	
	public List<Diary> DiaryList(int idx);
	public void InsertCalendar(Diary vo);
	public void DeleteCalendar(String cal_key);
}
