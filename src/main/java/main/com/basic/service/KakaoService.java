package main.com.basic.service;

import java.util.Map;



public interface KakaoService {
	
	
	public String getReturnAccessToken(String code);
	
	
	public Map<String,Object> getUserInfo(String access_token); 
	
	public void getLogout(String access_token);
}
