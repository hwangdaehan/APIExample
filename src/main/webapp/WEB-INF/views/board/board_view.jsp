<%@include file="../include_page/header.jsp" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 2021-03-08
	 댓글 한글 깨짐 현상 해결 방법
	 server.xml (was 설정) 포트번호 입력공간에 URLEncoding=UTF-8 입력 후 해결-->
<html>
	<head>
		<meta charset="UTF-8">
		<!-- dataTables GRID CDN -->
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
		<script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	</head>
	<body>
		<input type="hidden" value="<c:out value='${sessionConfigVO.user_name}'/>" id="session_user_name"/>
		<table id="dataTable" class="display" style="width:60%">
			<colgroup>
				<col style="width:10%"/>
				<col style="width:20%"/>
				<col style="width:30%"/>
				<col style="width:"/>
			</colgroup>
	        <tbody>
	        	<tr>
	        		<th>BOARD NUMBER</th>
	        		<td id="sid"><c:out value="${result.sid }"/></td>
	        		<th>TITLE</th>
	        		<th><c:out value="${result.title }"/></th>
	        	</tr>
				<tr>
					<th>CONTENT</th>
					<th colspan="3"><c:out value="${result.content }"/></th>
				</tr>
				<tr>
					<th>REPLY CNT</th>
					<th><c:out value="${result.reply_cnt}"/></th>
					<th>DATE</th>
	        		<th><c:out value="${result.creat_dt}"/></th>
				</tr>
				<tr>
					<th>VIEW COUNT</th>
					<th><c:out value="${result.view_cnt}"/></th>
					<th>WRITER</th>
	        		<th><c:out value="${result.writer}"/></th>
				</tr>
	        </tbody>
		</table>
		<div class="reply_div">
			<input type="button" id="reply_reg_btn" name="reply_reg_btn" class="btn btn-primary" value="GO"/>
			<input type="text" style="width:700px;" id="reply_content" name="reply_content" class="form-control"/>
			<c:forEach var="row" items="${replyResult}" varStatus="status">
				<div class="reply_list" reply_no="<c:out value='${row.reply_no}'/>" style="width:80%;height:40px;">
					<span style="width:60%"><c:out value="${row.reply_content}"/></span>
					<span style="width:20%"><c:out value="${row.reply_user}"/></span>
					<span style="width:20%"><c:out value="${row.creat_dt}"/></span>
				</div>	
			</c:forEach>
		</div>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	$("#dataTable").dataTable();
});


$("#reply_reg_btn").click(function(){
	$.ajax({
		url : "/reply/reply_proc.ajax",
		data : {
			sid : $("#sid").text(),
			reply_user : $("#session_user_name").val(),
			reply_content : $("#reply_content").val(),
			flag : "addRepl",
		},
		dataType : "post",
		success:function(data){
			console.log("야호");
			alert("등록처리");
		}
	})
});
</script>