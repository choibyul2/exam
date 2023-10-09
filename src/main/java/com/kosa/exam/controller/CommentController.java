package com.kosa.exam.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.exam.service.impl.CommentServiceImpl;
import com.kosa.exam.service.model.CommentVO;

/**메인 컨트롤러
 * @author kky
 *
 */
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller

public class CommentController extends PrtController {
	
	@Autowired
	private CommentServiceImpl _commentService;
	
	
	// 글 작성(POST)
	@ResponseBody
	@RequestMapping(value = "/commnet/register.do" , method = RequestMethod.POST)
	public Map<String, Object> register(@RequestBody CommentVO comment) throws Exception {
		System.out.println("댓글 작성 컨트롤러 진입");
		
		Map<String, Object> result = new HashMap<>();
		int status = _commentService.insert(comment);
		
		if(status > 0) {      
	         result.put("status", true);
	         result.put("message", "댓글이 등록되었습니다.");
	         result.put("comment", _commentService.insert(comment));
	      }else {
	         result.put("status", false);
	         result.put("message", "댓글이 등록되지 않았습니다.");   
	      }
		
		System.out.println("댓글 작성 성공여부 : " + status);

		return result;
		
	} // register
	

	
	// 글 수정(POST)
	@ResponseBody
	@RequestMapping(value = "/comment/modify.do" , method = RequestMethod.POST)
	public Map<String, Object> modify(@RequestBody CommentVO comment) throws Exception {
	      System.out.println("comment.controller.modify() invoked.");
	      
	      Map<String, Object> result = new HashMap<>();
	      int status = _commentService.insert(comment);
	      
	      if(status > 0) {      
	         result.put("status", true);
	         result.put("message", "댓글이 수정되었습니다.");
	      }else {
	         result.put("status", false);
	         result.put("message", "댓글이 수정되지 않았습니다."); 
	         result.put("comment", _commentService.commentList(comment.getBoardNum()));
	      }
	      
	      System.out.println("status : "+status);
	      
	      return result;
	} // modify
	
	
	
	// 글 삭제(POST)
	@ResponseBody
	@RequestMapping(value = "/comment/remove.do" , method = RequestMethod.POST)
	public Map<String, Object> remove(@RequestBody CommentVO comment) throws Exception {
	      System.out.println("comment.controller.remove() invoked.");
	      
	      Map<String, Object> result = new HashMap<>();
	      int status = _commentService.delete(comment);
	      
	      if(status > 0) {      
	         result.put("status", true);
	         result.put("message", "댓글이 삭제되었습니다.");
	         result.put("comment", _commentService.commentList(comment.getBoardNum()));
	      }else {
	         result.put("status", false);
	         result.put("message", "댓글이 삭제되지 않았습니다.");   
	      }
	      
	      System.out.println("status : "+status);
	      
	      return result;
	} // remove
	
	

}
