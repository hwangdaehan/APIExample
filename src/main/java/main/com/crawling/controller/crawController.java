package main.com.crawling.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class crawController {

	@RequestMapping(value="craw/craw_main.do")
	public String main() {
		return "craw/craw_main";
	}
	
	@RequestMapping(value="craw/craw_select.ajax")
	@ResponseBody
	public Map<String,Object> craw_select(String user_id,HttpServletRequest req,HttpServletResponse resp)throws Exception {
		boolean result =false;
		String url = "https://www.google.com/search?q="+user_id;
		System.out.println(url);
		Document doc =Jsoup.connect(url).get();
		
		Elements ele = doc.select("div.DALGre .mR2gOd");
		
		
		
			 
		
		List<String> NameResult = new ArrayList<>();
		NameResult.add(ele.select("div .EDblX.DAVP1 #vplap0").attr("label")); //과연
		System.out.println("출력");
		System.out.println(NameResult);
		
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
			result =true;
		
//		PrintWriter writer = resp.getWriter();
//		resp.setCharacterEncoding("UTF-8"); 
//		resp.setContentType("text/html;charset=UTF-8");
//		writer.println(result);
		
		return resultMap;
	}
}
