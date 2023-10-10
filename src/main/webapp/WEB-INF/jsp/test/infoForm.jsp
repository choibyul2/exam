<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="form1" action="remove.do?boardNum=${board.boardNum}" method="post">
	 <table class="nor_write">
			
			<colgroup>
				<col width="10%" />
				<col width="90%" />
			</colgroup>
			
			<tbody>
			 	<tr>
					<th>글번호</th>
					<td id="boardNum">${board.boardNum}</td>
				</tr>
				<tr>
					<th>글제목</th>

					<td>${board.title}</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${board.memId}</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${board.regDate}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<div class="content">
							${board.content}
						</div>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						${board.viewCount}
					</td>
				</tr>
				<tr>
					<th>댓글</th>
					<td>
					
						<c:forEach var="comment" items="${comment}">
							<div id="commentItem" >
							    <p><input type="hidden" name="commentNum" id="commentNum"/></p>
							    <p><span id="cmemId">${comment.cmemId}</span> | <span id="modDate">${comment.modDate}</span></p>
							    <p>${comment.content}</p>
							</div>	
						</c:forEach>	
						
					</td>
					
					<div id="commentList">
				 	  	<div id="commentListDiv">
				 	  	  	
				 	  	</div>
					</div>

						
					</td>
					
					<div id="commentList">
				 	  	<div id="commentListDiv">
				 	  	  	
				 	  	</div>
					</div>
					
				</tr>
				<tr>
					<th>댓글</th>
					<td colspan="3" class="memo">
						<div id="commentInsert">
							<input type="hidden" name="cmemId" id="cmemIdadmin" value="admin" />
							<input type="text" class="commentContent" style="width:75%;" placeholder="댓글 작성하기" /><a href="" onclick="commentInsert()" class="btn_s_grey mL5">저장</a>
						</div>
					</td>
				</tr>
			</tbody>
			
			
		</table>
		<div class="btn_wrp">
			<button type="button" class="btn_b_grey" id="modifyBtn">수정</button>
			<button type="submit" class="btn_b_blue" id="removeBtn">삭제</button>
			<button type="button" class="btn_b_grey" id="listBtn" >목록</button>
		</div>
</form>
		
<script type="text/javascript">


//목록 버튼을 눌러 목록으로 돌아가기
var listBtn = document.querySelector('#listBtn');

listBtn.addEventListener('click', function() {
	console.log('listBtn clicked');
	location.href="/exam/list.do";
});


//수정 버튼을 눌러 수정페이지로 가기
var modifyBtn = document.querySelector('#modifyBtn');

modifyBtn.addEventListener('click', function() {
    console.log('modifyBtn clicked');
    location.href = "/exam/modifyForm.do?boardNum=" + ${board.boardNum};
});



//댓글등록
//댓글등록
function commentInsert() {
	
	// 게시물의 board_num 가져오기
	const boardNum = $("#boardNum").text();
	const cmemId = $("#cmemIdadmin").val();
	const commentContent = $(".commentContent").val();

	console.log("boardNum ", boardNum);
	console.log("cmemId ", cmemId);
	console.log("commentContent", commentContent);
	console.log("modDate ", modDate);
	
	const param = {
			boardNum:  boardNum,
			cmemId: cmemId,
			content: commentContent,
	};
	
	fetch("<c:url value='comment/register.do' />", {
		method : "POST",
		headers : {
			"Content-Type" : "application/json; charset=UTF-8",
		},
		body : JSON.stringify(param),
	})
	.then((response) => response.json())
	.then((json) => {
		if(json.status) {
			alert("댓글이 작성되었습니다.");
			
 			const commentList = $("#commentList");
			commentList.empty();
			
			const comment = json.comment;
			console.log(comment);
			
			comments.forEach((comment) => {
			console.log(">>>" + comment.content);
			
			const commentItem = $("#commentItem").clone();
			commentItem.find(".commentContent").val(comment.content);
			commentItem.find("#cmemId").val(comment.cmemId);
			commentItem.find("#modDate").text(comment.modDate);
			commentItem.find("#commentNum").text(comment.commentNum);
			
			console.log("comment.commentNum", comment.commentNum);
			
 			commentItem.show();
			commentList.append();
			
				
			}
			
			) 
			
			
		} else {
			alert("댓글이 작성되지 않았습니다.");
		}

	});
}



</script>


