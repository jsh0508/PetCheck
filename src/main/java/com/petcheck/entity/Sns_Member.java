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
public class Sns_Member {
	
	// 회원넘버
	private int idx;
	
	// 아이디
	private String sns_id;
	
	// 닉네임
	private String nick;
	
	// 이름
	private String name;
	
	// sns타입
	private String sns_type;
	
	// 접속시간
	private Timestamp sns_connecte_date;
	
}
