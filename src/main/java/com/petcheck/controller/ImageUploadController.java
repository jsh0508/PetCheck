package com.petcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ImageUploadController {
	@GetMapping("/upload.do")
	public String showUploadPage() {
        return "upload"; // upload.html 템플릿을 렌더링
    }
}
