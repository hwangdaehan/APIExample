package main.com.board.vo;

public class ReplyVO {
	private int sid;
	private String reply_user;
	private String reply_content;
	private int delete_at;
	private int reply_no;
	private String creat_dt;
	public String getReply_user() {
		return reply_user;
	}
	public void setReply_user(String reply_user) {
		this.reply_user = reply_user;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getDelete_at() {
		return delete_at;
	}
	public void setDelete_at(int delete_at) {
		this.delete_at = delete_at;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getCreat_dt() {
		return creat_dt;
	}
	public void setCreat_dt(String creat_dt) {
		this.creat_dt = creat_dt;
	}
}
