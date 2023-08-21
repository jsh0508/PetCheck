package com.petcheck.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Criteria;
import com.petcheck.entity.PageMaker;
import com.petcheck.entity.Post;
import com.petcheck.mapper.PostMapper;

@Controller 
public class PostController {
	
	@Autowired
	private PostMapper mapper;
	
	// 게시물 목록
	@RequestMapping("postList.do")
	public String postList(Criteria cri, Model model) {
		
		List<Post> list = mapper.postList(cri);
		model.addAttribute("postlist", list);
		// 페이징
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("pm", pm);
		
		return "postList";
	}
	
	// 게시물 등록 페이지 이동
	@GetMapping ("/postRegister.do")
	public String postRegister() {
		return "postRegister";
	}
	
	// 게시물 등록	
	@PostMapping ("/postRegister.do")
	public String postRegister(Post pvo) {
		mapper.postRegister(pvo);
		return "redirect:/postList.do";
	}
	
	
	/*
	 * // 댓글 입력
	 * 
	 * @PostMapping ("/reply.do") public String replyregister (int post_idx) {
	 * mapper.replyRegister(post_idx); return "redirect:/postDetail.do";
}
	 */
	
	
	
	// 게시물 상세보기
	@RequestMapping("/postDetail.do")
	public String postDetail(@ModelAttribute("cri") Criteria cri, int post_idx, Model model) {
		Post pvo = mapper.postDetail(post_idx);
		model.addAttribute("pvo", pvo);
		model.addAttribute("cri", cri);
		//조회수 누적
		mapper.count(post_idx);
		System.out.println("상세보기 여기는 들어오냐");
		return "postDetail";
	
	}
	
	// 게시물 삭제
	// 변수 pvo로 변경하면 xml, mapper 수정하기
	@RequestMapping("/postDelete.do")
	public String postDelete(Criteria cri, int post_idx, RedirectAttributes rttr) {
	   System.out.println("삭제 들어오긴 하냐");
		mapper.postDelete(post_idx);
	   rttr.addAttribute("page", cri.getPage());
	   rttr.addAttribute("type", cri.getType());
	   rttr.addAttribute("keyword", cri.getKeyword());
	   return "redirect:/postList.do";
	}
	
	// 게시물 수정 페이지 이동
	@GetMapping("/postModify.do")
	public String modify (@ModelAttribute("cri") Criteria cri, int post_idx, Model model) {
		Post pvo = mapper.postDetail(post_idx);
		model.addAttribute("pvo", pvo);
		return "postModify";
	}
	
	// 게시물 수정
	@PostMapping("/postModify.do")
	public String postModify(Criteria cri, Post pvo, RedirectAttributes rttr) {
		System.out.println("여기도 못오냐 수정");
		mapper.postModify(pvo);
		rttr.addAttribute("post_idx", pvo.getPost_idx());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("type", cri.getType());
		return "redirect:/postDetail.do"; // 수정된 게시물로 경로 변경하기??
	}

	/* // 게시물 검색
	 * 
	 * @RequestMapping("/postSearch.do") public String postSearch(Criteria cri,
	 * Model model) {
	 * 
	 * List<Post> list = mapper.postSearch(cri); model.addAttribute("postlist",
	 * list); // 페이징 PageMaker pm = new PageMaker(); pm.setCri(cri);
	 * pm.setTotalCount(mapper.totalCount(cri)); model.addAttribute("pm", pm);
	 * 
	 * return "postSearch";
		}
	 */
}
