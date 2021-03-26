package common.com.basic;

import javax.servlet.http.HttpSession;

public class SystemUtil {
	
	
	/*관리자 계정 확인*/
	public static boolean AdminCheck() {
		HttpSession session = null;
		SessionConfigVO vo =(SessionConfigVO) session.getAttribute("sessionConfigVO");
		System.out.println(vo.getUser_id());
		return true;
	}
	
	/*문자 빈 값 체크*/
	public static boolean EmptyCheck(String str) {
		if(str =="" || str == null)
			return true;
		else
			return false;
	}
	
	/* int -> String 0 제거*/
	public static String zeroRemove(int str) {
		String result =Integer.toString(str).replaceAll("0", "");
		return result;
	}

	public static String zeroRemove(String str) {
		String result =str.replaceAll("0", "");
		return result;
	}
}
