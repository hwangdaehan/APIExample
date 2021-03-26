package main.com.board.service;

import java.util.List;

import main.com.board.vo.BoardVO;
import main.com.board.vo.ReplyVO;

public interface BoardService {

	public void insertBoard(BoardVO boardVO);
	
	public List<BoardVO> findBoardList();
	
	public BoardVO findBoardView(String sid);
	
	public void addViewCount(String sid);
	
	public void addReply(ReplyVO replyVO);
	
	
	public List<ReplyVO> findReplyView(int sid);
	
	public String ReplyCount(int sid);

	public String findBoardPassword(int sid);
}
