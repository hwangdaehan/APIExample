package main.com.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import main.com.board.vo.BoardVO;
import main.com.board.vo.ReplyVO;

@Mapper
public interface BoardMapper {
	public void insertBoard(BoardVO boardVO);
	
	public List<BoardVO> findBoardList();
	
	public BoardVO findBoardView(String sid);
	
	public void addViewCount(String sid);
	
	public void addReply(ReplyVO replyVO);
	
	public List<ReplyVO> findReplyView(int sid);
	
	public String ReplyCount(int sid);
	
	public String findBoardPassword(int sid);
}
