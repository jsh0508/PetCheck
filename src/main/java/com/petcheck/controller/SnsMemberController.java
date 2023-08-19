package com.petcheck.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petcheck.entity.Member;
import com.petcheck.entity.SnsMember;
import com.petcheck.mapper.SnsMemberMapper;

@Controller //POJO
public class SnsMemberController {
	// @Inject
	@Autowired // 설명(DI : 의존성주입)
	private SnsMemberMapper mapper;
	
	@PostMapping("/snsJoin.do")
	public String snsJoin(String sns_id, String nick, String sns_type, SnsMember svo, Model model, HttpSession session) {
		System.out.println("===================");
		System.out.println(sns_id);
		System.out.println(nick);
		System.out.println(sns_type);
		System.out.println("===================");
		String id = sns_id;
		svo.setId(id);
		svo.setNick(nick);
		svo.setSns_type(sns_type);
		
		SnsMember lvo = mapper.snsLoginCheck(svo);
		if (lvo == null) {
			mapper.snsJoin(svo);
			model.addAttribute("svo", svo);
			return "redirect:/snsLogin.do";
		} else {
			SnsMember mvo = mapper.snsLogin(lvo);
			session.setAttribute("mvo", mvo);
			return "redirect:/main.do";
		}
		
	}
	
	@RequestMapping("snsLogin.do")
	public String snsLogin(SnsMember lvo, HttpSession session) {
		SnsMember mvo = mapper.snsLogin(lvo);
		if (mvo != null) {
			session.setAttribute("mvo", mvo);
		}
		
		return "redirect:/main.do";
	}
}
