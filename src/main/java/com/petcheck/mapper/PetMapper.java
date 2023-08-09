package com.petcheck.mapper;

import com.petcheck.entity.Pet;

// @Mapper
// JDBC(Java+SQL) -> MyBatis Framework(Java<-분리->SQL(xml))
public interface PetMapper {
	
	// 회원가입 메소드
	public void addPet(Pet vo);
	
}