package com.aloa.manage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
	@Autowired
	ManagerDAO managerDAO;

	@RequestMapping(value = "manager/test", method = RequestMethod.GET)
	public String test() {
		return "manager/test";
	}

	// 회원관리
	@RequestMapping(value = "/manager/memberManage")
	public ModelAndView memberManage() {
		ModelAndView mav = new ModelAndView();

		List<MemberDTO> list = null;
		if (managerDAO.memberList() != null) {
			list = managerDAO.memberList();
		}
		System.out.println(list.get(0).getId());
		mav.addObject("list", list);
		mav.setViewName("manager/memberManage");

		return mav;
	}
	//회원관리-삭제
	@RequestMapping(value = "/manager/listRemove", method = RequestMethod.POST)
	public ModelAndView listRemove(@RequestParam String[] checkId){
		
		
		managerDAO.memberRemove(checkId);
	
		return new ModelAndView("redirect:/manager/memberManage");
		
		
		
	}
	@RequestMapping(value = "/manager/blacklistManage")
	public ModelAndView blacklistManage() {
		ModelAndView mav = new ModelAndView();

		List<MemberDTO> list = null;

		if (managerDAO.memberList() != null) {
			list = managerDAO.memberBlackList();

		}

		mav.addObject("list", list);
		mav.setViewName("manager/blacklistManage");

		return mav;
	}

	@RequestMapping(value = "manager/usingRejectedlistManage", method = RequestMethod.GET)
	public String usingRejectedlistManage() {
		return "manager/usingRejectedlistManage";
	}

	@RequestMapping(value = "manager/restaurantManage", method = RequestMethod.GET)
	public String restaurantManage(Model model) {

		List<RestaurantDTO> list = managerDAO.restaurantList();

		model.addAttribute("list", list);

		System.out.println("size=" + list.size());
		System.out.println("name=" + list.get(0).getResno());
		System.out.println("name=" + list.get(0).getResname());
		System.out.println(list.get(0).getBossemail());
		System.out.println(list.get(0).getRequest());
		System.out.println(list.get(0).getResaddress());
		System.out.println(list.get(0).getResholiday());
		System.out.println(list.get(0).getReskind());

		System.out.println(list.get(0).getResparking());
		System.out.println(list.get(0).getResprice());
		System.out.println(list.get(0).getResrest());
		System.out.println(list.get(0).getRessaletime());
		System.out.println(list.get(0).getRestel());

		return "manager/restaurantManage";
	}

	@RequestMapping(value = "/manager/restaurantAgree", method = RequestMethod.GET)
	public String restaurantAgree() {
		return "manager/restaurantAgree";
	}

	@RequestMapping(value = "manager/reviewClaim", method = RequestMethod.GET)
	public String reviewClaim() {
		return "manager/reviewClaim";
	}

	@RequestMapping(value = "manager/restaurantClaim", method = RequestMethod.GET)
	public String restaurantClaim() {
		return "manager/restaurantClaim";
	}

}
