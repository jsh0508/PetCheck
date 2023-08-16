package com.petcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatbotController {
	@GetMapping("/chatbot.do")
	public String showHospitalPage() {
        return "chatbot"; // chatbot.html 템플릿을 렌더링
    }
}
