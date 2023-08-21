package com.petcheck.entity;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//롬복
@Data
//올 생성자
@AllArgsConstructor
//노 생성자
@NoArgsConstructor
public class SnsMember {
	
	// 회원넘버
	private int idx;
	
	// 아이디
	private String id;
	
	private String pw;
	
	// 닉네임
	private String nick;
	
	 // 관리자여부 관리자여부
    private String admin_yn;

    // 가입일자 가입일자
    private Timestamp joindate;
	
	// sns타입
	private String sns_type;
	
}
