package com.petcheck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Member;
import com.petcheck.mapper.MemberMapper;

@Controller //POJO
public class MemberController {
	// @Inject
	@Autowired // 설명(DI : 의존성주입)
	private MemberMapper mapper;
	
	// 메인페이지 접속
	@RequestMapping("/main.do")
	public String index() {
		return "index";
	}
	
	// 회원가입 페이지 접속
	@GetMapping("/memberjoin.do")
	public String memberjoin() {
		
		return "join";
	}
	
	// 회원가입
	@PostMapping("/memberjoin.do")
	public String memberjoin(Member vo) {
		mapper.memberJoin(vo);
		
		return "index";
	}
	
	// 로그인 페이지 접속
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	
	// 로그인
	@PostMapping("/login.do")
	public String login(Member vo, HttpSession session) {
		
		Member mvo = mapper.login(vo);
		if (mvo != null) {
			session.setAttribute("mvo", mvo);
		}
		
		return "redirect:/main.do";
	}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/naver.do")
	public String naver() {
		return "naverLogin";
	}
	
	@RequestMapping("/naverLogin.do")
	public String naverLogin() {
		return "naverCollback";
	}
	
	// 정보 수정 페이지 이동
	@GetMapping("/myPage.do")
	public String myPage(int idx, Model model) {
		Member vo = mapper.checkInfo(idx);
		model.addAttribute("vo", vo);
		return "myPage";
	}
	
	// 정보 수정
	@PostMapping("/updateInfo")
	public String updateInfo(Member vo, RedirectAttributes rttr) {
		
		mapper.updateInfo(vo);
		rttr.addAttribute("idx", vo.getIdx());
		return "redirect:/main.do";
	}
	
	@RequestMapping("/deleteInfo.do")
	public String deleteInfo(int idx) {
		mapper.deleteInfo(idx);
		return "redirect:/main.do";
	}
	
}
