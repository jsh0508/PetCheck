package com.petcheck.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Diary;
import com.petcheck.entity.InviteVO;
import com.petcheck.entity.Member;
import com.petcheck.mapper.DiaryMapper;
import com.petcheck.mapper.MemberMapper;
import com.petcheck.mapper.PetMapper;

@Controller // POJO
public class MemberController {
	// @Inject
	@Autowired // 설명(DI : 의존성주입)
	private MemberMapper mapper;
	@Autowired
	private DiaryMapper mapper2;

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

	@RequestMapping("idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		int re = mapper.idCheck(id);
		return re;

	}

	// 로그인 페이지 접속
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}

	// 로그인
	@PostMapping("/login.do")
	public String login(Member vo, HttpSession session, Model model) {

		Member mvo = mapper.login(vo);
		if (mvo != null) {
			session.setAttribute("mvo", mvo);
			List<InviteVO> list = mapper.invitationList(vo);
			System.out.println("invitationlist -->" + list);
			session.setAttribute("list", list);

			return "redirect:/main.do";
		} else {
			model.addAttribute("msg", "잘못된 정보입니다.");
			return "login";
		}

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
	@RequestMapping("/myPage.do")
	public String myPage(int idx, Model model) {
		Member vo = mapper.checkInfo(idx);
		String id = vo.getId();
		model.addAttribute("id", id);
		return "forward:/petList.do";
	}

	// 정보 수정
	@PostMapping("/updateInfo")
	public String updateInfo(Member vo, RedirectAttributes rttr) {

		mapper.updateInfo(vo);
		rttr.addAttribute("idx", vo.getIdx());
		return "redirect:/main.do";
	}

	@RequestMapping("/deleteInfo.do")
	public String deleteInfo(int idx, HttpSession session) {
		mapper.deleteInfo(idx);
		session.invalidate();
		return "redirect:/main.do";
	}

//	@RequestMapping("/diary.do")
//	public String diary(int idx, Model request) {
//		List<Diary> list = mapper2.DiaryList(idx);
//		List<Member> memList = mapper.memberList();
//		request.addAttribute("list", list);
//		request.addAttribute("memList", memList);
//		return "diary";
//	}

	@RequestMapping("/diary2.do")
	public String diary(int idx, Model request) {
		List<Diary> list = mapper2.DiaryList(idx);
		List<Member> memList = mapper.memberList();
		request.addAttribute("list", list);
		request.addAttribute("memList", memList);
		return "diary2";
	}

}
