package com.petcheck.mapper;

import com.petcheck.entity.SnsMember;

// @Mapper
// JDBC(Java+SQL) -> MyBatis Framework(Java<-분리->SQL(xml))
public interface SnsMemberMapper {
	
	// 회원가입 메소드
	public void snsJoin(SnsMember svo);
	public SnsMember snsLogin(SnsMember mvo);
	public SnsMember snsLoginCheck(SnsMember svo);
}