package com.kosa.exam.service.impl;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kosa.exam.service.model.BoardVO;
import com.kosa.exam.service.model.search.BoardSearchVO;

import lombok.extern.slf4j.Slf4j;


@Service("boardService")
@Slf4j
public class BoardServiceImpl extends BaseServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	
	//일반 게시판 전체 목록
	public List<BoardVO> boardList(BoardSearchVO search) throws Exception {
		List<BoardVO> list = (List<BoardVO>) getDAO().selectBySearch("board.selectBoardList", search, "totalCount");
		System.out.println("boardService.boardList -> "+ list);
		
		return list;
	}
	
	
	//일반 게시판 상세 보기
	public Object boardGet(BoardVO board) throws Exception {
		
		return getDAO().selectOne("board.selectBoardGet", board);
	}
	
	
	//일반 게시판 글 작성
	public int insert(BoardVO board) throws Exception {
		
		return getDAO().insert("board.insertBoard", board);	
	}
	
	
	//일반 게시판 글 수정
	public int update(BoardVO board) throws Exception {

		return getDAO().update("board.updateBoard", board);	
	}
	
	
	//일반 게시판 글 삭제
	public int delete(BoardVO board) throws Exception {

		return getDAO().delete("board.deleteBoard", board);	
	}
	
}
