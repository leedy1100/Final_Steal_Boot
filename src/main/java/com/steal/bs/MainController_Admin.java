package com.steal.bs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.steal.bs.dto.EmpDto;
import com.steal.bs.dto.MainDto;
import com.steal.bs.model.MainBiz;

@Controller
public class MainController_Admin {

	@Autowired
	MainBiz biz;
	
	@RequestMapping("/admin/employeelist")
	public String employeeList(Model model) {

		List<MainDto> list = biz.selectList();
		if(list.size()==1) {
			model.addAttribute("list", null);
		}else {
			model.addAttribute("list", list);
		}

		return "admin_employeelist";
	}

	@RequestMapping("/admin/selectone")
	public String employeeOne(Model model, @RequestParam(value = "id") String id) {

		model.addAttribute("employee", biz.selectOne(id));

		return "admin_employeeone";
	}

	@RequestMapping("/admin/empUpdate")
	public String empUpdate(Model model, MainDto dto, @RequestParam(value = "emp_no") int emp_no,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		int res = 0;
		res = biz.empUpdate(dto);

		if (res > 0) {
			System.out.println("empupdate succeed");
			biz.empDelete(emp_no);
			biz.empNameUpdate(dto.getMain_name(), String.valueOf(dto.getMain_emp()));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원 번호가 수정되었습니다.'); location.href='/admin/selectone?id="+dto.getMain_id()+"'</script>");
			out.flush();
		} else {
			System.out.println("empupdate error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원번호를 확인해주세요.'); history.go(-1); </script>");
			out.flush();
		}
		model.addAttribute("list", biz.selectList());

		return "admin_employeelist";
	}

	@RequestMapping("/admin/empDel")
	public String empDel(Model model, @RequestParam(value = "seq") int seq, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		int res = 0;

		res = biz.delete(seq);

		if (res > 0) {
			System.out.println("empdelete succeed");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원정보가 삭제되었습니다.');</script>");
			out.flush();
		} else {
			System.out.println("empdelete error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원정보 삭제에 실패했습니다.'); history.go(-1);</script>");
			out.flush();
		}

		model.addAttribute("list", biz.selectList());

		return "admin_employeelist";
	}

	@RequestMapping("/admin/empInsert")
	public String empInsert(Model model, EmpDto dto, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int res = 0;

		res = biz.empInsert(dto);

		if (res > 0) {
			System.out.println("empdelete succeed");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원 등록이 되었습니다.'); location.href='/admin/empList';</script>");
			out.flush();
		} else {
			System.out.println("empdelete error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원 등록에 실패했습니다.'); history.go(-1);</script>");
			out.flush();
		}

		model.addAttribute("list", biz.empList());

		return "admin_emplist";
	}

	@RequestMapping("/admin/empList")
	public String empList(Model model) {
		
		List<EmpDto> list = biz.empList();
		
		if(list.size()==1) {
			model.addAttribute("list", null);
		}else {
			model.addAttribute("list", list);
		}

		return "admin_emplist";
	}

	@RequestMapping("/admin/empDelete")
	public String empDelete(Model model, @RequestParam(value = "emp_no") int emp_no, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		int res = 0;

		res = biz.empDelete(emp_no);

		if (res > 0) {
			System.out.println("empdelete succeed");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원정보가 삭제되었습니다.'); location.href='/admin/empList';</script>");
			out.flush();
		} else {
			System.out.println("empdelete error");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사원정보 삭제에 실패했습니다.'); history.go(-1);</script>");
			out.flush();
		}

		model.addAttribute("list", biz.empList());

		return "admin_emplist";
	}
}
