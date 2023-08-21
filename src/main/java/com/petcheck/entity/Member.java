package com.petcheck.entity;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 롬복
@Data
// 올 생성자
@AllArgsConstructor
// 노 생성자
@NoArgsConstructor
public class Member {
// 회원 회원
		
		// 회원넘버 회원넘버
		private int idx;
		
	    // 이메일 이메일
	    private String id;

	    // 비밀번호 비밀번호
	    private String pw;

	    // 별명 별명
	    private String nick;

	    // 관리자여부 관리자여부
	    private String admin_yn;

	    // 가입일자 가입일자
	    private Timestamp joindate;
	    
	    private String sns_type;

}
