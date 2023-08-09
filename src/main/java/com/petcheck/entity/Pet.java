package com.petcheck.entity;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 롬복
@Data
// 올 생성자
@AllArgsConstructor
// 노 생성자
@NoArgsConstructor
public class Pet {
// 회원 회원
		
		// 펫 순번
		private int pet_seq;
	
	    // 아이디
	    private String id;

	    // 펫 품종
	    private String pet_race;

	    // 펫 출생일
	    private Date pet_birthdate;

	    // 펫 이름
	    private String pet_name;

	    // 펫 성별
	    private String pet_gender;

}
