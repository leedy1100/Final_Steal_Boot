package com.steal.bs;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.steal.bs.model.DocumentBiz;
import com.steal.bs.model.DocumentDto;

@Controller
public class MainController_move {

	@Autowired
	private DocumentBiz biz;
	
	@RequestMapping("/")
	public String welcomhome(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "Main_home";
	}
	
	@RequestMapping("insertdocform")
	public String insertDocForm(Model model) {
		return "insertdocform";
	}
	
	@RequestMapping(value = "insertdoc", method = RequestMethod.GET)
	@ResponseBody
	public String insertDoc(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String draft_date = request.getParameter("draft_date");
		String deadline = request.getParameter("deadline");
		String collaborator = request.getParameter("collaborator");
		String settlement = request.getParameter("settlement");
		DocumentDto dto = new DocumentDto();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setDraft_date(draft_date);
		dto.setDeadline(deadline);
		dto.setContent(content);
		dto.setCollaborator(collaborator);
		dto.setSettlement(settlement);
		biz.insert(dto);
		
		return "";
	}
	
	@RequestMapping("draftdoc")
	public String draftdoc(Model model) {
		List<DocumentDto> list = biz.selectList();
		model.addAttribute("list", list);
		return "draftdoc";
	}
	
	@RequestMapping("docinfo")
	public String docInfo(Model model, HttpServletRequest request) {
		String title = request.getParameter("title");
		DocumentDto dto = biz.docInfo(title);
		model.addAttribute("dto", dto);
		return "docinfo";
	}
	
}
