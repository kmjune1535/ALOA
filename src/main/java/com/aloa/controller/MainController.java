package com.aloa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aloa.restaurant.Restaurant;
import com.aloa.restaurant.RestaurantDTO;
import com.aloa.restaurant.RestaurantService;
import com.aloa.review.ImageRepository;
import com.aloa.review.Imageboard;
import com.aloa.service.MemberService;

@Controller
public class MainController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	RestaurantService resService;
	
	@Autowired
	ImageRepository imageRepository;
	
	private Facebook facebook; //페이스북 api 객체
	private ConnectionRepository cr; //페이스북 연결 정보
	public MainController(Facebook facebook, ConnectionRepository cr){
		this.facebook = facebook;
		this.cr = cr;
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Model model, HttpSession session){
		
		if(cr.findPrimaryConnection(Facebook.class)!=null){
			String[] fields={"id","name","birthday","email","gender"};
			User user = facebook.fetchObject("me", User.class,fields);  //me 는 로그인한 사용자의 정보. me/friends 하면 친구정보가 나옴
			String name = user.getName();
			String id = user.getId();
			String birthday = user.getBirthday();
			String email = user.getEmail();
			String gender = user.getGender();
	  		
			
			model.addAttribute("name", name);
			model.addAttribute("id", id);
			model.addAttribute("birthday", birthday);
			model.addAttribute("email", email);
			model.addAttribute("gender", gender);
			
			
			session.setAttribute("username", name);
		}
		
		List<Restaurant> restaurantlist =resService.findList();
		List<RestaurantDTO> reslist = new ArrayList<RestaurantDTO>();
		
		if(restaurantlist!=null){
			for(int i=0;i<restaurantlist.size();i++){
				//맛집의 이미지 가져오기
				List<Imageboard> imagelist = imageRepository.findByResno(restaurantlist.get(i).getResno());
				
				//레스토랑DTO에 넣기
				RestaurantDTO res = new RestaurantDTO();
				res.setImagelist(imagelist);
				res.setRestaurant(restaurantlist.get(i));
				
				reslist.add(res);
				
			}
		}
		
		model.addAttribute("reslist",reslist);
		
		
		
		
		return "main/home";
	}
	
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public String searchList(){
		
		return "search/searchList";
	}
	
	@RequestMapping(value = "/searchFilter", method = RequestMethod.GET)
	public String searchFilter() {
		
		return "search/searchFilter";
	}
	
	@RequestMapping(value="/storejoinForm",method=RequestMethod.GET)
	public ModelAndView storejoinForm(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list/storejoin");
		return mav;
	}
	
	@RequestMapping(value="/storejoin",method=RequestMethod.POST)
	public String storejoin(Restaurant restaurant,@RequestParam String bossemail){
		
		
		System.out.println(restaurant.getBossemail()+
				restaurant.getResaddress()
				+bossemail
				);
		restaurant.setBossemail(bossemail);
		
		resService.createRes(restaurant);
		
		return "redirect:/";
	}
	
	
	
	
	
}