package com.kosa.exam.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kosa.exam.service.model.BoardVO;
import com.kosa.exam.service.model.CommentVO;
import com.kosa.exam.service.model.search.BoardSearchVO;

import lombok.extern.slf4j.Slf4j;

@Service("commentService")
@Slf4j
public class CommentServiceImpl extends BaseServiceImpl {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	
	
	// 댓글 전체 목록
	public List<CommentVO> commentList(int boardNum) throws Exception { 
		List<CommentVO> list  = (List<CommentVO>) getDAO().selectList("comment.commentList", boardNum);
	 	
	 	return list;
	 }
	
	// 댓글 작성
	public int insert(CommentVO comment) throws Exception {
		
		return getDAO().insert("comment.insertComment", comment);
	}
	
	// 댓글 수정
	public int update(CommentVO comment) throws Exception {
		
		return getDAO().update("comment.updateComment", comment);
	}

	
	// 댓글 삭제
	public int delete(CommentVO comment) throws Exception {
		return getDAO().delete("comment.dComment", comment);
		
	}
	
	
}
