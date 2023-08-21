package com.petcheck.entity;

import java.math.BigDecimal;
import java.security.Timestamp;
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
public class Reply {
// 회원 회원

	    // 글 순번
	    private int post_idx;

	    // 글 제목
	    private String post_title;

	    // 글 내용
	    private String post_content;

	    // 글 첨부파일
	    private String post_file;

	    // 글 작성일자
	    private Date created_at;

	    // 글 조회수
	    private int post_views;

	    // 작성자 아이디
	    private String id;

	    // 닉네임
	    private String nick;
	    



}
