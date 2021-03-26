package main.com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.com.basic.SystemUtil;
import main.com.board.service.BoardService;
import main.com.board.vo.BoardVO;
import main.com.board.vo.ReplyVO;

@Controller
public class BoardController {

	@Resource
	BoardService boardService;
	
	@RequestMapping(value="/board/main_board.do")
	public String board(ModelMap model) {
		String reply_cnt;
		List<BoardVO> result =boardService.findBoardList();
		for(int i=0; i<result.size(); i++) {
			result.get(i).setView_cnt(result.get(i).getView_cnt().replaceAll("0",""));
			reply_cnt =boardService.ReplyCount(result.get(i).getSid());
			result.get(i).setReply_cnt(reply_cnt);
		}
		
		model.put("result", result);
		return "/board/main_board";
	}

	@RequestMapping(value="/board/input.do")
	public String inputBoard() {
		return "/board/board_input";
	}
	
	@RequestMapping(value="/board/view.do")
	public String viewBoard(ModelMap modelMap,@RequestParam String sid) {
		BoardVO resultVO =boardService.findBoardView(sid);
		if(!SystemUtil.EmptyCheck(resultVO.getTitle())) {
			/*자료 상세 보기*/
			resultVO.setReply_cnt(boardService.ReplyCount(Integer.parseInt(sid)));
			resultVO.setView_cnt((SystemUtil.zeroRemove(resultVO.getView_cnt())));
			boardService.addViewCount(sid);
			modelMap.put("result",resultVO);
			/*해당 자료 댓 글*/
			int result_sid = Integer.parseInt(sid);
			List<ReplyVO> replyResult =boardService.findReplyView(result_sid);
			modelMap.put("replyResult", replyResult);
		}else {
			throw new RuntimeException("자료 조회 실패");
		}
		return "/board/board_view";
	}
	
	
	@RequestMapping(value ="/board/board_proc.ajax")
	public void boardProc(@ModelAttribute("boardVO") BoardVO boardVO , @RequestParam String flag, HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean result =false;
		switch(flag) {
			case "add":
				boardService.insertBoard(boardVO);
				result =true;
				break;
			case "delete":
				result =true;
				break;
			case "update":
				result =true;
				break;
		}
		
		PrintWriter writer =response.getWriter();
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		writer.println(result);
	}
	
	@RequestMapping(value="/board/findBoardPassword.do")
	@ResponseBody
	public String findPassword(@RequestParam int sid)throws IOException {
			String result =boardService.findBoardPassword(sid);
		return result;
	}
	
	@RequestMapping(value ="/reply/reply_proc.ajax")
	public void ReplyProc(@ModelAttribute("replyVO") ReplyVO replyVO , @RequestParam String flag, HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean reply_result =false;
		switch(flag) {
			case "addRepl":
				boardService.addReply(replyVO);
				reply_result =true;
				break;
		}
		
		PrintWriter reply_writer =response.getWriter();
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		reply_writer.println(reply_result);
	}
	
	
	
}
