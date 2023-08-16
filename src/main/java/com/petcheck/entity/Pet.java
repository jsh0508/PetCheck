package com.petcheck.entity;

import org.springframework.web.multipart.MultipartFile;

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
	    private String pet_birthdate;

	    // 펫 이름
	    private String pet_name;

	    // 펫 성별
	    private String pet_gender;
	    
	    // 펫 상세품종
	    private String detail_race;
	    
	    // 펫 이미지
	    private String pet_img;  // 이미지 경로 또는 URL을 저장할 문자열 필드
	    
	    private MultipartFile petImg;  // 업로드된 이미지 파일을 담을 MultipartFile 필드

}
