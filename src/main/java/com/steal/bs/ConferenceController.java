package com.steal.bs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.steal.bs.conference.ConfereceBiz;
import com.steal.bs.dto.ConferenceDto;
import com.steal.bs.dto.DepDto;
import com.steal.bs.dto.MainDto;
import com.steal.bs.model.MainBiz;


@Controller
public class ConferenceController {
	
	@Autowired
	MainBiz bizM;
	
	@Autowired
	ConfereceBiz bizC;
	
	@RequestMapping("memberList.conference")
	@ResponseBody
	public String getMemberList() {
		
		List<MainDto> list = null;
		
		try{
			list = bizM.selectList();
		} catch (Exception e) {
			System.out.println("memberList.conference Error");
		}
		

		ObjectMapper mapper = new ObjectMapper();
		String str = null;
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println(" json error ");
		}
		
		return str;
	}
	
	@RequestMapping("depList.conference")
	@ResponseBody
	public String getDEPList() {
		
		List<DepDto> list = null;
		
		try{
			list = bizC.selectList();
		} catch (Exception e) {
			System.out.println("memberList.conference Error");
		}
		

		ObjectMapper mapper = new ObjectMapper();
		String str = null;
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println(" json error ");
		}
		return str;
	}

	@RequestMapping("roomList.conference")
	@ResponseBody
	public String getRoomList(@RequestParam("id") String id) {
		
		List<ConferenceDto> list = null;
		
		try{
			list = bizC.selectRoomList(id);
		} catch (Exception e) {
			System.out.println("memberList.conference Error");
		}
		

		ObjectMapper mapper = new ObjectMapper();
		String str = null;
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println(" json error ");
		}
		return str;
	}
	
	@RequestMapping("roomMember.conference")
	@ResponseBody
	public String getRoomMember(@RequestParam("id") String id) {
		
		String roomname=null;
		
		try{
			roomname = bizC.selectRoomMember(id);
		} catch (Exception e) {
			System.out.println("memberList.conference Error");
		}
		
		return roomname;
	}
	
	@RequestMapping("joinedMember.conference")
	@ResponseBody
	public String getJoinedMember(@RequestParam("room") String room) {
		
		List<String> joinedmember=null;
		
		try{
			joinedmember = bizC.selectJoinedMember(room);
		} catch (Exception e) {
			System.out.println("memberList.conference Error");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String str = null;
		try {
			str = mapper.writeValueAsString(joinedmember);
		} catch (Exception e) {
			System.out.println(" json error ");
		}
		
		return str;
	}
	
	@RequestMapping("chathome.conference")
	public void chathome(Model model, @ModelAttribute ConferenceDto dto, @RequestParam("id") List<String> id, HttpServletResponse response) {
		
		dto.setTotalcount(id.size()+1);
		for(int i = 0; i<id.size(); i++) {
			switch (i) {
			case 0:
				dto.setUser1(id.get(i));
				break;
			case 1:
				dto.setUser2(id.get(i));
				break;
			case 2:
				dto.setUser3(id.get(i));
				break;
			case 3:
				dto.setUser4(id.get(i));
				break;
			case 4:
				dto.setUser5(id.get(i));
				break;
			case 5:
				dto.setUser6(id.get(i));
				break;
			default:
				break;
			}
		}
		if(dto.getUser2()==null) {
			dto.setUser2("");
			dto.setUser3("");
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser3()==null) {
			dto.setUser3("");
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser4()==null) {
			dto.setUser4("");
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser5()==null) {
			dto.setUser5("");
			dto.setUser6("");
		} else if(dto.getUser6()==null) {
			dto.setUser6("");
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<form action=\"http://localhost:8787/bs/chat.tiles\" id=\"send\"  method=\"get\" >\r\n" + 
					"		<input type=\"hidden\" name=\"name\" value=\""+dto.getName()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"totalcount\" value=\""+dto.getTotalcount()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"master\" value=\""+dto.getMaster()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user1\" value=\""+dto.getUser1()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user2\" value=\""+dto.getUser2()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user3\" value=\""+dto.getUser3()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user4\" value=\""+dto.getUser4()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user5\" value=\""+dto.getUser5()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"user6\" value=\""+dto.getUser6()+"\" >\r\n" + 
					"		<input type=\"hidden\" name=\"content\" value=\""+dto.getContent()+"\" >\r\n" + 
					"	</form><script type=\"text/javascript\">\r\n" + 
					"		document.getElementById('send').submit();\r\n" + 
					"	</script>");
			out.flush();
		} catch (IOException e) {
			System.out.println("sendinfo error");
		}
		
	}
	
	@RequestMapping("chatjoin.conference")
	public void chatjoin(Model model, @ModelAttribute ConferenceDto dto, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<form action=\"http://localhost:8787/bs/chat.tiles\" id=\"send\"  method=\"get\" >\r\n" + 
					"		<input type=\"hidden\" name=\"name\" value=\""+dto.getName()+"\" >\r\n" +
					"		<input type=\"hidden\" name=\"user1\" value=\""+dto.getUser1()+"\" >\r\n" + 
					"	</form><script type=\"text/javascript\">\r\n" + 
					"		document.getElementById('send').submit();\r\n" + 
					"	</script>");
			out.flush();
		} catch (IOException e) {
			System.out.println("sendinfo error");
		}
		
	}
	
	@RequestMapping("checkRoom.conference")
	@ResponseBody
	public String checkRoom(Model model, String name) throws Exception {
		
		ConferenceDto dto = bizC.checkRoom(name);
		
		if(dto == null) {
			return "1";
		} else {
			return "0";
		}
	}
	
}