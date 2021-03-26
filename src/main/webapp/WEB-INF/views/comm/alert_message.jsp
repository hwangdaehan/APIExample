<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${message.title }</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
</html>
<script type="text/javascript">
	//<![CDATA[
		<c:choose>
			<c:when test="${message.type eq 'alert'}">
				<c:if test="${message.msg !=''}">
					alert("<c:out value="${message.msg}"/>");
				</c:if>
				<c:out value="${message.script}" escapeXml="false" />
			</c:when>
		</c:choose>
	//]]>
</script>