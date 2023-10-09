package com.kosa.exam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosa.exam.service.impl.BoardServiceImpl;
import com.kosa.exam.service.impl.CommentServiceImpl;
import com.kosa.exam.service.model.BoardVO;
import com.kosa.exam.service.model.CommentVO;
import com.kosa.exam.service.model.search.BoardSearchVO;

/**메인 컨트롤러
 * @author kky
 *
 */
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller

public class TestController extends PrtController {
	
	@Autowired
	private BoardServiceImpl _boardService;
	
	@Autowired
	private CommentServiceImpl _commentService;
	
	
	// 메인페이지
	/*
	 * @RequestMapping("main.do") public String mainIndex(SearchVO search, Model
	 * model) throws Exception { super.setPageSubTitle("메인 페이지 테스트", model); // jsp
	 * 페이지에 타이틀로 사용 (main.jsp 참고) => ${pageTitle }
	 * 
	 * 
	 * model.addAttribute("test", getConfig().getAdminName()); // 관리자 이름
	 * globals.properties 테스트
	 * 
	 * return "main"; }
	 */
	
	
	// 게시글 목록 페이지
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list(BoardSearchVO search, Model model) throws Exception {
		
		model.addAttribute("list", _boardService.boardList(search));
		model.addAttribute("search", search);
		
		return "board/boardlist";
	}


	// 글 상세 페이지(GET)
	@RequestMapping(value = "get.do" , method = RequestMethod.GET)
	public String get(Model model, BoardVO board, CommentVO comment) throws Exception {
		System.out.println("글 상세페이지 컨트롤러 진입");
		
		model.addAttribute("board", _boardService.boardGet(board));
		model.addAttribute("comment", _commentService.commentList(comment.getBoardNum()));
		
		return "test/infoForm";
	}
	
	
	// 글 작성 페이지(GET)
	@RequestMapping(value = "registerForm.do" , method = RequestMethod.GET)
	public String registerForm(Model model, BoardVO board) throws Exception {
		
		return "test/insertForm";
	}
	
	// 글 작성(POST)
	@RequestMapping(value = "register.do" , method = RequestMethod.POST)
	public String register(Model model, BoardVO board) throws Exception {
		System.out.println("글 작성 컨트롤러 진입");
		int success = _boardService.insert(board);
		System.out.println("글 작성 성공여부 : " + success);

		return "redirect:/list.do";
		
	} // register
	
	
	
	
	// 글 수정 페이지 (GET)
	@RequestMapping(value = "modifyForm.do" , method = RequestMethod.GET)
	public String modifyForm(Model model, BoardVO board) throws Exception {
		
		model.addAttribute("board", _boardService.boardGet(board));
		
		return "test/updateForm";
	}
	
	// 글 수정(POST)
	@RequestMapping(value = "modify.do" , method = RequestMethod.POST)
	public String modify(BoardVO board) throws Exception {
		
		int success = _boardService.update(board);
		System.out.println("글 수정 성공여부 : " + success);
		
		return "redirect:/list.do";
	} // modify
	
	
	
	// 글 삭제(POST)
	@RequestMapping(value = "remove.do" , method = RequestMethod.POST)
	public String remove(BoardVO board) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>> 글 삭제 컨트롤러 진입");
		int success = _boardService.delete(board);
		System.out.println("글 삭제 성공여부 : " + success);
		
		return "redirect:/list.do";
	} // remove
	
	
	
	
	
	
	// 테스트 페이지
	@RequestMapping(value = "test.do")
	public String test(Model model) {
		
		return "test/test";
	}
}
