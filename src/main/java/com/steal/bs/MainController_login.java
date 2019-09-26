package com.steal.bs;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.steal.bs.model.MainBiz;
import com.steal.bs.model.MainDto;

@Controller
public class MainController_login {
	
	@Autowired
	MainBiz biz;
	
	@RequestMapping(value = "login.main", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute MainDto dto,HttpSession session) {
		
		MainDto userdto = null;
		
		try {
			userdto = biz.selectOne(dto);
		} catch (Exception e) {
			System.out.println("login.main Error");
		}
		
		if(userdto==null) {
			session.setAttribute("logininfo", "1");
			return "redirect:./";
		} else {
			session.setAttribute("userinfo", userdto);
			
			return "redirect:./";
		}
	}
	
	@RequestMapping(value = "signup.main", method = RequestMethod.POST)
	public String signup(Model model, @ModelAttribute MainDto dto) {
		
		dto.setMain_security(0);
		
		int res = 0;
		try {
			res = biz.insert(dto);
		} catch (Exception e) {
			System.out.println("signup.main Error");
		}
		
		model.addAttribute("res",res);
		
		return "redirect:./";
		
	}
	
	@RequestMapping(value = "logout.main", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		
		session.removeAttribute("userinfo");
		
		return "redirect:./";
		
	}
	
	@RequestMapping("loginidchk.main")
	@ResponseBody
	public String loginidchk(@RequestParam("id") String id) {
		
		String resurtid = biz.loginidchk(id);
		
		return resurtid;
		
	}
	
	@RequestMapping("signupempchk.main")
	@ResponseBody
	public String signupempchk(@RequestParam("emp") String emp) {
		
		String resurtemp = biz.signupempchk(emp);
		
		return resurtemp;
		
	}
	
	@RequestMapping("myinfo.main")
	public String myinfo(Model model, HttpSession session) {
		
		model.addAttribute("userinfo",session.getAttribute("userinfo"));
		
		return "Main_myinfo";
		
	}
	
	@RequestMapping(value = "infoupdate.main", method = RequestMethod.POST)
	public String infoupdate(Model model, @ModelAttribute MainDto dto) {
		
		dto.setMain_security(0);
		
		int res = 0;
		try {
			res = biz.insert(dto);
		} catch (Exception e) {
			System.out.println("signup.main Error");
		}
		
		model.addAttribute("res",res);
		
		return "redirect:./";
		
	}
	
	
}
