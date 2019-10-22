package com.steal.bs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.steal.bs.dto.MainDto;
import com.steal.bs.model.MainBiz;

@Controller
public class MainController_login {
	
	@Autowired
	MainBiz biz;

	@RequestMapping(value = "signup.main", method = RequestMethod.POST)
	public String signup(Model model, @ModelAttribute MainDto dto, HttpSession session) {
		
		if(dto.getMain_emp()==0) {
			dto.setMain_authority("ROLE_ADMIN");
		}else {
			dto.setMain_authority("ROLE_USER");
		}
		
		int res = 0;
		try {
			res = biz.insert(dto);
		} catch (Exception e) {
			System.out.println("signup.main Error");
		}
		
		if(res==0) {
			session.setAttribute("logininfo", "2");
		} else {
			session.setAttribute("logininfo", "1");
		}
		
		model.addAttribute("res",res);
		
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
	public String myinfo(Model model, HttpSession session, String id) {
		
		MainDto userdto = biz.selectOne(id);
		
		model.addAttribute("userinfo",userdto);
		
		return "Main_myinfo";
		
	}
	
	@RequestMapping(value = "infoupdate.main", method = RequestMethod.POST)
	public void infoupdate(@ModelAttribute MainDto dto, HttpSession session, HttpServletResponse response) {
		
		int res = 0;
		
		try {
			res = biz.update(dto);
		} catch (Exception e) {
			System.out.println("infoupdate.main Error");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보 수정 실패. 관리자에게 문의하세요.'); history.go(-1); </script>");
				out.flush();
			} catch (IOException e1) {
				System.out.println("PrintWriter 실패");
			}
		}
		
		if(res==0) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보수정 실패. 관리자에게 문의하세요.'); history.go(-1); </script>");
				out.flush();
			} catch (IOException e1) {
				System.out.println("PrintWriter 실패");
			}
		} else {
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보 수정 되었습니다. 재 로그인 해주세요.'); location.href='/'</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping("updatepwchk.main")
	@ResponseBody
	public String updatepwchk(@RequestParam("seq") String seq) {
		
		String resurtpw = biz.updatepwchk(seq);
		
		return resurtpw;
		
	}
	
	@RequestMapping("infodelete.main")
	public void delete(@RequestParam("seq") int seq, HttpSession session, HttpServletResponse response) {
		
		int res = 0;
		
		try {
			res = biz.delete(seq);
		} catch (Exception e) {
			System.out.println("delete.main Error");
			
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('회원탈퇴 실패. 관리자에게 문의하세요.'); history.go(-1); </script>");
				out.flush();
			} catch (IOException e1) {
				System.out.println("PrintWriter 실패");
			}
		}
		
		if(res==0) {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('회원탈퇴 실패. 관리자에게 문의하세요.'); history.go(-1); </script>");
				out.flush();
			} catch (IOException e1) {
				System.out.println("PrintWriter 실패");
			}
		} else {
			session.invalidate();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('회원탈퇴 되었습니다.'); location.href='/'</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
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
		
		String id = "";
		MainDto dto = new MainDto();
		dto.setMain_name(name);
		dto.setMain_email(email);
		
		id = biz.pwsearch(dto);
		
		return id;
		
	}
	
	@RequestMapping("/user/userpage")
	public String userPage() {
		return "userpage";
	}
	
	@RequestMapping("/accessDenied")
	public String forBidden() {
		return "accessDenied";
	}
	
	@RequestMapping("pwchange.main")
	public String pwChange(Model model, @RequestParam("id") String id) {
		
		MainDto userdto = biz.selectOne(id);

		model.addAttribute("userinfo",userdto);
		
		return "pwchangeform";
		
	}
	
}
