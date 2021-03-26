<%@include file="../include_page/header.jsp" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<!-- dataTables GRID CDN -->
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
	<script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<table id="dataTable" class="display" style="width:100%">
		<colgroup>
			<col style="width:10%"/>
			<col style="width:20%"/>
			<col style="width:30%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
			<col style="width:10%"/>
		</colgroup>
        <thead>
            <tr>
                <th>No</th>
                <th>TITLE</th>
                <th>CONTENT</th>
                <th>WRITER</th>
                <th>REPLY</th>
                <th>DATE</th>
                <th>VIEW COUNT</th>
            </tr>
        </thead>
        <tbody>
				 <c:forEach var="row" items="${result}" varStatus="status">
				 	<c:choose>
						<c:when test="${not empty row.bd_password}">
				        	<tr>
				        		 <td>${row.sid}</td>
				        		<td colspan="2">Secret Board&nbsp;&nbsp;&nbsp;
				        			<input style="width:100px;display:inline;" type="password" name="check_pw" class="form-control check_pw"/>
				        			<input type="button" class="btn check_pw_btn" value="VIEW"/>
				        		</td>
								<td>${row.writer}</td>
				        		<td>${row.reply_cnt}</td>
				                <td>${row.creat_dt}</td>
				                <td>${row.view_cnt}</td>
				        	</tr>
		      			</c:when>
		      			<c:otherwise>
				        	<tr>
				                <td>${row.sid}</td>
				                <td class="view" style="cursor:pointer;">${row.title}</td>
				                <td>${row.content}</td>
				                <td>${row.writer}</td>
				                <td>${row.reply_cnt}</td>
				                <td>${row.creat_dt}</td>
				                <td>${row.view_cnt}</td>
				            </tr>
						</c:otherwise>
					</c:choose>
		      	</c:forEach>	
        </tbody>
        <tfoot>
            <tr>
                <th>No</th>
                <th>TITLE</th>
                <th>CONTENT</th>
                <th>WRITER</th>
                <th>REPLY</th>
                <th>DATE</th>
                <th>VIEW_COUNT</th>
            </tr>
        </tfoot>
    </table>
    <div>
    	<input type="button" id="write_btn" name="write_btn" class="btn" value="WRITE"/>
    </div>
</body>
</html>
<script>
$(document).ready(function() {
    $('#dataTable').DataTable();
});

/*상세보기 페이지 전환*/
$(".view").click(function(){
	var sid =$(this).prev().text();
	var url = "/board/view.do?&sid="+sid;
	location.href=url;
})

/*글 작성 팝업 open*/
$("#write_btn").click(function(){
	var pop_name ="WRITE FORM";
	var popOption = "width=800, height=650, top=100, left=300,location=no"
	window.open("/board/input.do",pop_name,popOption);
});

/*비밀 글 읽기*/
$(".check_pw_btn").click(function(){
	var sid =$(this).parent().prev().text();
	var password =$(this).siblings().val();
	console.log(password);
	$.ajax({
		url: "/board/findBoardPassword.do",
		type:"post",
		data: {
			sid :sid,
		},
		success:function(data){
			if(data == password){
				var url = "/board/view.do?&sid="+sid;
				location.href=url;
			}else{
				alert("비밀번호가 틀립니다.");									
			}
		}
	})
	
})
</script>