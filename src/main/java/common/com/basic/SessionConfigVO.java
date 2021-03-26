package common.com.basic;

public class SessionConfigVO {

	private String user_id;
	private String user_name;
	private String user_phone;
	private boolean naver_login;
	private String profile_img;
	private String kakaoToken;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public boolean isNaver_login() {
		return naver_login;
	}
	public void setNaver_login(boolean naver_login) {
		this.naver_login = naver_login;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getKakaoToken() {
		return kakaoToken;
	}
	public void setKakaoToken(String kakaoToken) {
		this.kakaoToken = kakaoToken;
	}

}
