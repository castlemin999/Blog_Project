package com.choisblog.web.board.service;

import java.util.List;

import com.choisblog.web.board.model.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList() throws Exception;
	
}
