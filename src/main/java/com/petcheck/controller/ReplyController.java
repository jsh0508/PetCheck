package com.petcheck.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Criteria;
import com.petcheck.entity.PageMaker;
import com.petcheck.entity.Post;
import com.petcheck.mapper.ReplyMapper;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	// @Autowired
	
	//@Inject
	//ReplyService replyservice;
	
	// 댓글 입력
	//@RequestMapping("replyRegister.do")
	//pu
	
	
}
