package com.finalproject.voda;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.main.model.service.MainService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private MainService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("mainpage")
	public ModelAndView home(ModelAndView model) {
		List<Contents> list = null; 
		
		list = service.getContentsRankList();
		
		model.addObject("list", list);
		model.setViewName("mainpage");
		return model;
	}
	
}
