package com.petcheck.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petcheck.entity.Criteria;
import com.petcheck.entity.Post;


// 인터페이스 클래스만 찾기 위해 어노테이션 쓰기 (일반클래스도 넣어두고 짬뽕이 된다면 써놔야함)
// 하지만 인터페이스 파일만 존재하면 어노테이션 안써도 된다.
// @Mapper
// JDBC(Java+SQL) -> MyBatis Framework(Java<-분리->SQL(xml))
public interface ReplyMapper {
	
	// 게시물 조회
	public List<Post> postList(Criteria cri);// 추상메서드
	
	// 게시물 검색
	/* public List<Post> postSearch(Criteria cri); */
	
	// 게시물 작성
	public void postRegister (Post pvo);
	
	// 게시물 상세보기
	public Post postDetail (int post_idx);
	
	// 게시뭃 수정
	public void postModify (Post pvo);
    
    // 게시물 삭제
    public void postDelete (int post_idx);
    
    // 조회수 누적 메서드
 	@Update("update t_post set post_views=post_views+1 where post_idx=#{post_idx}")
 	public void count(int post_views);
	
	 // 전체 게시글의 수를 구하는 메서드 
 	public int totalCount(Criteria cri);
 	
 	// 댓글 압력
 	// public void replyRegister(int post_idx);
	 

 	
	
}