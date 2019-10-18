package com.steal.bs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ConferenceController {

	@RequestMapping("chathome.chat")
	public String chathome(Model model, @RequestParam("id") String id) {
		
		return "redirect:http://192.168.10.7:8787/bs/chat.tiles?id="+id+"&authority=0";
		
	}
	
}
