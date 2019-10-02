package com.steal.bs;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.steal.bs.model.MainDto;

@Controller
public class ConferenceController {

	@RequestMapping("chathome.chat")
	public String chathome(Model model, HttpSession session) {
		
		MainDto dto = (MainDto)session.getAttribute("userinfo");
		
		if(dto.getMain_id().equals("zongyeng")) {
			return "redirect:http://localhost:8787/bs/chat.tiles?id="+dto.getMain_id();
		} else {
			return "redirect:http://192.168.10.7:8787/bs/chat.tiles?id="+dto.getMain_id();
		}
		
		
		
	}
	
}
