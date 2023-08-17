package com.petcheck.mapper;

import java.util.List;

import com.petcheck.entity.Pet;

// @Mapper
// JDBC(Java+SQL) -> MyBatis Framework(Java<-분리->SQL(xml))
public interface PetMapper {
	
	// 회원가입 메소드
	public void insertPet(Pet vo);
	public void updatePet(Pet vo);
	public void deletePet(int pet_seq);
	public List<Pet> petList(Pet vo);
	public Pet selectPet(Pet vo);
	public Pet upPet(int pet_seq);
}