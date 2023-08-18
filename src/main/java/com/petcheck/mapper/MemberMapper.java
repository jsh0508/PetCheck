package com.petcheck.mapper;

import java.util.List;

import com.petcheck.entity.InviteVO;
import com.petcheck.entity.Member;

// @Mapper
// JDBC(Java+SQL) -> MyBatis Framework(Java<-분리->SQL(xml))
public interface MemberMapper {
	
	// 회원가입 메소드
	public void memberJoin(Member vo);
	public Member login(Member mvo);
	public Member checkInfo(int idx);
	public void updateInfo(Member vo);
	public void deleteInfo(int idx);
	public List<InviteVO> invitationList(Member vo);
	public List<Member> memberList();
}