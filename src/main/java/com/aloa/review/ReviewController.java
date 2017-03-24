package com.aloa.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping(value = "/reviewWriteForm", method = RequestMethod.GET)
	public String reviewWriteForm() {
		return "review/reviewWrite";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(ReviewBoard dto){
		reviewService.reviewWrite(dto);
		
		return "redirect:/reviewWriteForm";
	}
}