package com.petcheck.entity;

import lombok.Data;

// 페이징 처리에서 기준클래스
@Data
public class Criteria {
	   private int page; 
	   private int perPageNum;
	   // 검색에 필요한 변수 추가
	   private String type;
	   private String keyword;
	   
	   public Criteria() {
		   this.page=1;
		   this.perPageNum=5; //=3
	   }
	   // 3.선택한 페이지에 해당하는 게시글의 시작번호 구하기
	   // 1page : 0~perPageNum, 2page : 10~perPageNum, 3page : 20~perPageNum
	   // select * from reply order by bgroup desc, bseq asc
	   // LIMIT offset, 10
	   public int getPageStart() {
		   return (page-1)*perPageNum;
	   }   
	}

