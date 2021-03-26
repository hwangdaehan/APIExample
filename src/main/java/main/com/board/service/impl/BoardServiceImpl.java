package main.com.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.com.board.dao.BoardMapper;
import main.com.board.service.BoardService;
import main.com.board.vo.BoardVO;
import main.com.board.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	BoardMapper boardMapper;
	
	@Override
	public void insertBoard(BoardVO boardVO) {
		boardVO.setDelete_at("0");
		boardVO.setReply_cnt("0");
		boardVO.setView_cnt("00000000");
		boardMapper.insertBoard(boardVO);
	}

	@Override
	public List<BoardVO> findBoardList() {
		
		return boardMapper.findBoardList();
	}

	@Override
	public BoardVO findBoardView(String sid) {
		
		return boardMapper.findBoardView(sid);
	}

	@Override
	public void addViewCount(String sid) {
		boardMapper.addViewCount(sid);
	}

	@Override
	public void addReply(ReplyVO replyVO) {
		replyVO.setDelete_at(0);
		boardMapper.addReply(replyVO);
		
	}

	@Override
	public List<ReplyVO> findReplyView(int sid) {
		
		return boardMapper.findReplyView(sid);
	}

	@Override
	public String ReplyCount(int sid) {
		
		return boardMapper.ReplyCount(sid);
	}

	@Override
	public String findBoardPassword(int sid) {
		
		return boardMapper.findBoardPassword(sid);
	}

}
