package com.petcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HospitalController {
	@GetMapping("/hospital.do")
	public String showHospitalPage() {
        return "hospital"; // hospital.html 템플릿을 렌더링
    }
}
