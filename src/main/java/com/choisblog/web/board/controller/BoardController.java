package com.choisblog.web.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choisblog.web.board.model.BoardVO;
import com.choisblog.web.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	// 블로그 리스트 조회
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public String getBoardList(Model model) throws Exception{
		model.addAttribute("boardList", boardService.getBoardList());
		return "board/index";
	}
	
	// 블로그 글쓰기 화면 이동
	@RequestMapping(value="/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}
	
	// 블로그 게시글 저장
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("BoardVO")BoardVO boardVO, RedirectAttributes rttr) throws Exception{
		boardService.insertBoard(boardVO);
		return "redirect:/board/getBoardList";
	}
	
}
