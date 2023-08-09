package com.petcheck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Member;
import com.petcheck.entity.Pet;
import com.petcheck.mapper.PetMapper;

@Controller //POJO
public class PetController {
	// @Inject
	@Autowired // 설명(DI : 의존성주입)
	private PetMapper mapper;
	
	@RequestMapping("/addPet.do")
	public String addPet(Pet pvo, Member mvo, RedirectAttributes rttr) {
		System.out.println(mvo.getIdx());
		mapper.addPet(pvo);
		rttr.addAttribute("idx", mvo.getIdx());
		return "myPage";
	}
	
	
}
