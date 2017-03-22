package com.aloa.restaurant;

import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aloa.review.ReviewBoardDTO;
import com.aloa.review.ReviewService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService service;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ModelMapper modelmapper;
	
	@Autowired
	private RestaurantRepository repository;
	
	
	@RequestMapping(value="/detailView",method=RequestMethod.GET)
	public String detailView(String resName
							,Model model ){
		
		/*Restaurant restaurant = service.findOne(resName);
		List<ReviewBoardDTO> reviewList = 
				reviewService.reviewList(resName);
		
		model.addAttribute("restaurant",restaurant);
		model.addAttribute("reviewList",reviewList);*/
		
		return "detail/detailView";
	}
}