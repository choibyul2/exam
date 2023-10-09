<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<c:url value='boardlist.do'/>">게시판 테스트</a><br/>

페이지 타이틀 테스트 : ${pageTitle }<br/>
관리자 이름 프로퍼티파일 테스트 : ${test } <br/>
스프링 메시지 프로퍼티파일 테스트 : <s:message code="success.request.msg" /><br/>
</body>
</html>