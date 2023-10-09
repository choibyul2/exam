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
					<td>${board.boardNum}</td>
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
						          <p><input type="hidden" name="commentNum"/></p>
						          <p><span>${comment.cmemId}</span> | <span>${comment.modDate}</span></p>
						          <p>${comment.content}</p>
						</c:forEach>	
					</td>
				</tr>
				<tr>
					<th>댓글</th>
					<td colspan="3" class="memo">
						<div>
							<input type="hidden" name="cmemId" value="admin" />
							<input type="text" class="input" style="width:75%;" placeholder="댓글 작성하기" /><a href="" class="btn_s_grey mL5">저장</a>
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





</script>


