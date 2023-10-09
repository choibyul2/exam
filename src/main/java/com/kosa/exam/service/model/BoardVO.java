package com.kosa.exam.service.model;



import java.sql.Date;

import com.kosa.exam.service.model.general.GeneralModel;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO implements GeneralModel {
	private static final long serialVersionUID = 5812978017275882923L;
	
	private int boardNum;
	private String memId;
	private String title;
	private String content;
	private Date regDate;
	private Date modDate;
	private int viewCount;
	private int pid;
	private int level;


}
