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
	public String infoupdate(@ModelAttribute MainDto dto, HttpSession session) {
		
		int res = 0;
		
		try {
			res = biz.update(dto);
		} catch (Exception e) {
			System.out.println("infoupdate.main Error");
			session.setAttribute("logininfo", "3");
			return "Main_myinfo";
		}
		
		if(res==0) {
			session.setAttribute("logininfo", "3");
			return "Main_myinfo";
		} else {
			session.removeAttribute("userinfo");
			session.setAttribute("logininfo", "2");
		}
		
		return "redirect:./";
		
	}
	
	@RequestMapping("updatepwchk.main")
	@ResponseBody
	public String updatepwchk(@RequestParam("seq") String seq) {
		
		String resurtpw = biz.updatepwchk(seq);
		
		return resurtpw;
		
	}
	
	@RequestMapping("infodelete.main")
	public String delete(@RequestParam("seq") int seq, HttpSession session) {
		
		int res = 0;
		
		try {
			res = biz.delete(seq);
		} catch (Exception e) {
			System.out.println("delete.main Error");
			session.setAttribute("logininfo", "5");
			return "Main_myinfo";
		}
		
		if(res==0) {
			session.setAttribute("logininfo", "5");
			return "Main_myinfo";
		} else {
			session.removeAttribute("userinfo");
			session.setAttribute("logininfo", "4");
		}
		
		return "redirect:./";
	}
	
	@RequestMapping("idsearch.main")
	@ResponseBody
	public String idsearch(@RequestParam("name") String name,@RequestParam("birth") int birth) {
		
		MainDto dto = new MainDto();
		dto.setMain_name(name);
		dto.setMain_birth(birth);
		
		String resurtid = biz.idsearch(dto);
		
		return resurtid;
		
	}
	
	@RequestMapping("pwsearch.main")
	@ResponseBody
	public String pwsearch(@RequestParam("name") String name,@RequestParam("email") String email) {
		
		MainDto dto = new MainDto();
		dto.setMain_name(name);
		dto.setMain_email(email);
		
		String resurtid = biz.pwsearch(dto);
		
		return resurtid;
		
	}
	
}
