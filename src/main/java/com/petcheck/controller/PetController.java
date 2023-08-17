package com.petcheck.controller;

import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcheck.entity.Member;
import com.petcheck.entity.Pet;
import com.petcheck.mapper.PetMapper;

@Controller //POJO
public class PetController {
	// @Inject
	@Autowired // 설명(DI : 의존성주입)
	private PetMapper mapper;
	
	
	@RequestMapping("/petList.do")
	public String petList(Pet pvo, Model request) {
		List<Pet> list = mapper.petList(pvo);
		request.addAttribute("list", list);
		return "myPage";
	}
	
	@GetMapping("/addPet.do")
	public String addPet() {
		return "addPet";
	}
	
	@PostMapping("/insertPet.do")
	public String insertPet(MultipartHttpServletRequest mpRequest, int idx, String id, Pet vo, Model model) {
	    MultipartFile petImageFile = mpRequest.getFile("petImg");

	    if (petImageFile != null && !petImageFile.isEmpty()) {
	        String uploadDir = mpRequest.getSession().getServletContext().getRealPath("/resources/petImgUploads/");
	        
	        // 중복 파일 관리를 위해 파일명 변경
	        String originalFilename = petImageFile.getOriginalFilename();
	        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        String uniqueFilename = UUID.randomUUID().toString() + extension;

	        try {
	            // 이미지 파일 저장
	            Path filePath = Paths.get(uploadDir, uniqueFilename);
	            Files.copy(petImageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	            // 저장된 파일명을 펫 객체에 설정 (상대 경로로 변환)
	            String relativeFilePath = "/resources/petImgUploads/" + uniqueFilename;
	            vo.setPet_img(relativeFilePath);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
		
		mapper.insertPet(vo);
		model.addAttribute("id", id);
		model.addAttribute("idx", idx);
		return "redirect:/myPage.do";
	}
	
	@RequestMapping("/upPet.do")
	public String upPet(int pet_seq, Model model) {
		Pet vo = mapper.upPet(pet_seq);
		pet_seq = vo.getPet_seq(); 
		model.addAttribute("vo", vo);
		System.out.println(vo);
		return "updatePet";
	}
	
	@RequestMapping("/updatePet.do")
	public String updatePet(RedirectAttributes rttr , Model model, int pet_seq, int idx, String id, Pet vo) {
		vo.setPet_seq(pet_seq);
		rttr.addAttribute("pet_seq", pet_seq);
		mapper.updatePet(vo);
		model.addAttribute("id", id);
		model.addAttribute("idx", idx);
		return "redirect:/myPage.do";
	}
	
	@RequestMapping("/deletePet.do")
	public String deletePet(int pet_seq) {
		mapper.deletePet(pet_seq);
		return "redirect:/myPage.do";
	}
	
}
