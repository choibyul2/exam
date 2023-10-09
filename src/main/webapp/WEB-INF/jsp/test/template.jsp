<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script id="boardTemplate" type="text/x-jsrender">
	<tr>
		<td class="checkbox-cell"><input type="checkbox" name="chkBoardNum" class="chkbox" value="{{:boardNum }}"></td>
    	<td>{{:boardNum}}</td>
		<td style="text-align: left;">
          <a href="#" onclick="info({{:boardNum}})">{{:title}}</a>
        </td>
    	<td>{{:memId}}</td>
    	<td>{{:modDate }}</td>
    	<td>{{:viewCount }}</td>
	</tr>
</script>

<script>
function addWrite() {
 	
	fetch("<c:url value='예제입니다'/>", {
		  method: "POST",
		  body: "넘길데이터",
		})
		  .then((response) => response.json())
		  .then((json) => {
			  const board = "이곳에 json으로 넘어온 데이터 넣기"
			  const boardTemplate = $("#boardTemplate").html();
			  const tmpl = $.templates(boardTemplate);
			  const renderedboard = tmpl.render(board); // render 리스트 여러건, 한건 모두 다 출력
			  
			  const boardListHTML = $("이곳에 데이터 구성한걸 어디다 넣을지 div나 table이나 tbody등 id나 class값 넣기");
			  $(boardListHTML).prepend(renderedboard); // 목록 맨 위에 추가 하기
			  $(boardListHTML).append(renderedboard); // 목록 마지막에 추가하기
		  })
	
// 	$.ajax({
// 		url: "<c:url value='/board/boardWrite.do'/>",
// 		type: "POST",
// 		contentType: "application/json; charset=UTF-8",
// 		data: JSON.stringify(param),
// 		dataType: "json",
// 		success: (json) => {
// 		  const board = json.boardRow;
// 		  const boardTemplate = $("#boardTemplate").html();
// 		  const tmpl = $.templates(boardTemplate);
// 		  const renderedboard = tmpl.render(board);
		  
// 		  const boardListHTML = $("#boardbottom");
// 		  $(boardListHTML).prepend(renderedboard);

// 		}
// 	});
	
}

</script>

</body>
</html>