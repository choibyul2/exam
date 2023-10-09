<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
</head>
<form action="register.do" method="POST">
	 <table class="nor_write">
			
			<colgroup>
				<col width="10%" />
				<col width="90%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title" placeholder="제목" class="text_title"><br></td>
				</tr>
				<tr>
					<!-- 글쓴이 -->
					<td><input type="hidden" name="memId" value="admin" ></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<div class="content">
							<textarea name="content" id="faq_ct" placeholder="내용" ></textarea>
						</div>
					</td>
				</tr>
			</tbody>
			
		</table>
		<div class="btn_wrp">
			<button type="submit" id="registerBtn" >등록</button>
			<button type="button" id="listBtn" >목록</button>
		</div>
</form>
		
<script type="text/javascript">

/* 위지윅 적용 */
ClassicEditor
    .create(document.querySelector('#faq_ct'))
    .catch(error=>{
        console.error(error);
    });


</script>
<script>

//목록 버튼을 눌러 목록으로 돌아가기
	var listBtn = document.querySelector('#listBtn');
	
	listBtn.addEventListener('click', function() {
		console.log('listBtn clicked');
		location.href="/exam/list.do";
	});

</script>


