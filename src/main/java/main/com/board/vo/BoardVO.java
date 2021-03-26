package main.com.board.vo;

public class BoardVO {

	private int sid;
	private String bd_password;
	private String title;
	private String content;
	private String writer;
	private String file_nm;
	private String reply_cnt;
	private String creat_dt;
	private String user_id;
	private String delete_at;
	private String view_cnt;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getBd_password() {
		return bd_password;
	}
	public void setBd_password(String bd_password) {
		this.bd_password = bd_password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(String reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public String getCreat_dt() {
		return creat_dt;
	}
	public void setCreat_dt(String creat_dt) {
		this.creat_dt = creat_dt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDelete_at() {
		return delete_at;
	}
	public void setDelete_at(String delete_at) {
		this.delete_at = delete_at;
	}
	public String getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}
}
