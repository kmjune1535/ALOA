package com.aloa.review;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.aloa.restaurant.Restaurant;
import com.aloa.restaurant.RestaurantRepository;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewRepository repository;
	
	@Autowired
	private RestaurantRepository resRepository;
	
	
	@RequestMapping(value = "/reviewWriteForm", method = RequestMethod.GET)
	public String reviewWriteForm(@RequestParam int resno,Model model,@RequestParam String email) {
		Restaurant restaurant = resRepository.findByResno(resno);
		List<Reviewboard> reviewList = reviewService.reviewList(resno);
		int checking =0;
		
		for(int i=0; i<reviewList.size();i++){
			if(reviewList.get(i).getEmail().equals(email)){
				checking=1;
				model.addAttribute("check",1);
			}
		}
		
		if(checking==0){
			model.addAttribute("check",0);
		}
		model.addAttribute("resno",resno);
		model.addAttribute("restaurant", restaurant);
		
		return "review/reviewWriteForm";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(@RequestParam int resno
							,@RequestParam String content
							,@RequestParam int grade
							,@RequestParam(required=false) String email
							,Model model){
		Restaurant restaurant = resRepository.findByResno(resno);
		model.addAttribute("restaurant", restaurant);

		if(email!=null){
				
				Reviewboard dto = new Reviewboard();
				dto.setContent(content);
				dto.setEmail(email);
				dto.setGrade(grade);
				dto.setResno(resno);
				reviewService.reviewWrite(dto);
			
			
		}
		
		
		
		return "redirect:/";
	}
}