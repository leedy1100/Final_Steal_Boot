package com.steal.bs;

import java.util.List;

//import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.steal.bs.Cal.CalBiz;
//import com.fasterxml.jackson.core.JsonProcessingException;
//mport com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.SerializationFeature;
import com.steal.bs.dto.CalDto;

import net.sf.json.JSONArray;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CalBiz biz;

	
	/**
	 * Simply selects the home view to render by returning its name.
	 *
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome calendar! The client locale is {}.", locale);
/*		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";

		return "index";
	}
*/	

	@RequestMapping(value = "/selectEventList.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray selectEventList(Model model,@RequestParam(value = "start") String start) {
//		logger.info("Event List from DB.");
/*
 * 		// list -> json 
 */ 	
		//JSONArray jsonList;
		
  		//JSONArray jsonArray = new JSONArray();
  		List<CalDto> eventList = biz.selectList(start);
		model.addAttribute("list", eventList); 
		
		// Create ObjectMapper object.
//        ObjectMapper mapper = new ObjectMapper();
//        mapper.enable(SerializationFeature.INDENT_OUTPUT);
     // Serialize Object to JSON.
//        String json = null;

//			json = mapper.writeValueAsString(eventList);

//			JSONArray jsonList = new JSONArray(json);
			
		JSONArray jsonList = JSONArray.fromObject(eventList);
//		model.addAttribute("jsonList", jsonList);
 /**/
		return jsonList;
	}

	
	@RequestMapping(value = "/insertEvent.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertEvent(Model model, @ModelAttribute CalDto dto) {
//		logger.info("Insert Event List to DB.");
/*		
 * 		json -> dto
 */


		int res = biz.insertEvent(dto);
/*		
		if(res == 0){	// fail
			alert("Event Insert Fail!");
		}else{	// success
			alert("Event Insert Success!");
*/			
		return res;
	}

	@RequestMapping(value = "/updateEvent.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int updateEvent(Model model, @ModelAttribute CalDto dto, @RequestParam(value = "id") int id) {
//		logger.info("update Event List to DB.");

		dto.set_id(id);
//		System.out.println(dto.get_id());

		int res = biz.updateEvent(dto);
	
		return res;
	}

	
	@RequestMapping(value = "/deleteEvent.do", method = RequestMethod.POST)
	@ResponseBody
	public int deleteEvent(Model model, @RequestParam(value = "_id") int id) {
//		logger.info("delete Event List to DB.");
		
		 int res = biz.deleteEvent(id);
/*
		if(res == 0){	// fail
			alert("Event Delete Fail!");
		} else{	// success
			alert("Event Delete Success!");			
*/		
		return res;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String home() {
//		logger.info("Insert Event Page.");
		
		return "insertEvent";
	}
	
}
