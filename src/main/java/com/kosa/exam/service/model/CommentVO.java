package com.kosa.exam.service.model;

import java.sql.Date;

import com.kosa.exam.service.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentVO implements GeneralModel {
	  private static final long serialVersionUID = 5812978017275882923L;
	
      private int commentNum;   	// 코멘트 아이디
      private int boardNum;      	// 참고할 공지사항 아이디
      private String cmemId;      	// 작성자
      private String content;       // 댓글 내용
      private Date regDate;      	// 작성날짜
      private Date modDate;   		// 수정날짜
  	  private String N;

  	  
} // end class
