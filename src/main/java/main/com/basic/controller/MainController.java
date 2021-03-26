
package main.com.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import common.com.basic.SessionConfigVO;
import common.com.basic.SystemUtil;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import main.com.basic.service.KakaoService;
import main.com.basic.service.MainService;
import main.com.basic.vo.UserVO;
import main.naver.com.NaverLoginVO;


@Controller
public class MainController {
	/* NaverLoginBO */
	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginVO naverLoginVO) {
	this.naverLoginVO = naverLoginVO;
	}
	
	@Resource
	MainService mainService;
	@Resource
	KakaoService kakaoService;
	
	/*최초 접속*/
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(ModelMap model,HttpSession session) throws IOException {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		
		List<UserVO> userList =mainService.findUserList();
		model.addAttribute("userList", userList);
		
		return "home";
	}
	
	
	@RequestMapping(value ="/main/main.do")
	public String main() {
		return "home";
	}
	
	@RequestMapping(value ="/login/login_proc", method =RequestMethod.POST)
	public String loginProc(HttpSession session,HttpServletRequest req, HttpServletResponse resp, ModelMap modelMap,@ModelAttribute("userVO") UserVO userVO) {
		
		if(SystemUtil.EmptyCheck(userVO.getUser_id()))
			throw new RuntimeException("아이디를 입력해주세요");
		if(SystemUtil.EmptyCheck(userVO.getUser_pw()))
			throw new RuntimeException("비밀번호를 입력해주세요");
		
		UserVO findUserVO = mainService.findUser(userVO.getUser_id());
		SessionConfigVO sessionConfigVO = new SessionConfigVO();
		sessionConfigVO.setUser_id(findUserVO.getUser_id());
		sessionConfigVO.setUser_name(findUserVO.getUser_name());
		sessionConfigVO.setUser_phone(findUserVO.getUser_phone());
		sessionConfigVO.setNaver_login(false);
		sessionConfigVO.setProfile_img(findUserVO.getProfile_img());
		if(!findUserVO.getUser_id().equals(userVO.getUser_id()) ||  !findUserVO.getUser_pw().equals(userVO.getUser_pw())) {
			throw new RuntimeException("아이디 및 비밀번호를 확인해주세요");
		}else {
			session.setAttribute("sessionConfigVO", sessionConfigVO);
			session.setAttribute("user_name", sessionConfigVO.getUser_name());
		}
			
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/login/logout_proc")
	public String logout(ModelMap modelMap, HttpSession session)throws IOException {
		if(SystemUtil.EmptyCheck((String)session.getAttribute("kakaoToken"))){
		}else {
			kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
		}
		session.setAttribute("sessionConfigVO", null);
		HashMap<String, String> message = new HashMap<>();
		message.put("title", "로그아웃");
		message.put("script", "location.href='/'");
		message.put("msg", "로그아웃 되었습니다");
		message.put("type","alert");
		modelMap.addAttribute("message",message);
		return "/comm/alert_message";
	}
	
	@RequestMapping(value="/join/reg_proc.ajax", method = RequestMethod.POST)
	public void reg_proc(HttpServletRequest req, HttpServletResponse resp, @RequestParam String flag, @ModelAttribute("userVO") UserVO userVO, ModelMap modelMap) throws IOException {
		boolean result = false;
		switch(flag) {
		case "add" : 
			mainService.addUser(userVO);
			result = true;
			break;
		case "delete" : 
			mainService.deleteUser(userVO.getUser_id(),userVO.getUser_pw());
			result = true;
			break;
		case "update" : 
//			mainService.updateUser();
			result = true;
			break;
		}
		
		PrintWriter writer = resp.getWriter();
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html;charset=UTF-8");
		writer.println(result);
	}
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginVO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginVO.getUserProfile(oauthToken); //String형식의 json데이터
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = null;
	try {
		obj = parser.parse(apiResult);
	} catch (org.json.simple.parser.ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String user_name = (String)response_obj.get("nickname");
	String user_id = (String)response_obj.get("email");
	String user_phone =(String)response_obj.get("mobile");
	SessionConfigVO sessionConfigVO =new SessionConfigVO();
	sessionConfigVO.setUser_id(user_id);
	sessionConfigVO.setUser_name(user_name);
	sessionConfigVO.setUser_id(user_phone);
	sessionConfigVO.setNaver_login(true);
	//4.파싱 닉네임 세션으로 저장
	session.setAttribute("sessionConfigVO", sessionConfigVO);
	session.setAttribute("user_name", sessionConfigVO.getUser_name());
	return "redirect:/";
	}
	
	/*실시간 CHAT 팝업*/
	@RequestMapping(value="/echo")
	public String echotest() {
		return "/";
	}
	
	@RequestMapping(value="/lgoin/sendMail.do")
	public void mailsend(@RequestParam String email, ModelMap model) throws AddressException, MessagingException{
		String sender = "smtp.naver.com";
		
		final String userId ="qkfmdeo";
		final String userPw ="3859534a";
		int port =25;
		
		// 메일 내용 
		String recipient = email; 
		//받는 사람의 메일주소를 입력해주세요. 
		String subject = "메일발송"; 
		//메일 제목 입력해주세요. 
		String body = userId+"님으로 부터 메일을 받았습니다."; 
		//메일 내용 입력해주세요. 
		Properties props = System.getProperties(); 
		// 정보를 담기 위한 객체 생성 
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", sender); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", sender);

		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
				String un=userId; String pw=userPw; 
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
					return new javax.mail.PasswordAuthentication(un, pw); 
				} 
		});
		session.setDebug(true);
		Message mimeMessage = new MimeMessage(session); 
		//MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("qkfmdeo@naver.com")); 
		//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음

		mimeMessage.setSubject(subject); 
		//제목셋팅 
		mimeMessage.setText(body); 
		//내용셋팅 
		Transport.send(mimeMessage); 
		//javax.mail.Transport.send() 이용

	}
	
	
	@RequestMapping(value="/main/kakao_login.ajax")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("3276564ca92890b42124e9a28fda8be0"); //카카오 앱에 있는 REST KEY
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:8080/kakao_callback"); //카카오 앱에 등록한 redirect URL
		loginUrl.append("&response_type=code");
		
		return "redirect:"+loginUrl.toString();
	}
	
	
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
	public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
			System.out.println(code);
			
			//접속토큰 get
			String kakaoToken = kakaoService.getReturnAccessToken(code);
			
			//접속자 정보 get
			Map<String,Object> result = kakaoService.getUserInfo(kakaoToken);
			System.out.println("컨트롤러 출력"+result.get("nickname")+result.get("profile_image"));
			SessionConfigVO configVO =new SessionConfigVO();
			configVO.setUser_name((String)result.get("nickname"));
			configVO.setProfile_img((String)result.get("profile_image"));
			
			session.setAttribute("sessionConfigVO", configVO);
			/*로그아웃 처리 시, 사용할 토큰 값*/
			session.setAttribute("kakaoToken", kakaoToken);
		return "redirect:/";
	}

}
