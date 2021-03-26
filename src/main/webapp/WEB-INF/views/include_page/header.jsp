<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/common.css"/>
<!-- 	<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css" /> -->
	<script
		  src="https://code.jquery.com/jquery-3.5.1.min.js"
		  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		  crossorigin="anonymous"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/bootstrap.js"></script>
	<script src="../resources/js/common.js"></script>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>테스트 페이지 생성</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="container-header">
		<input type="hidden" value="<c:out value='${sessionConfigVO.user_id }'/>" id="session_id"/>
		<input type="hidden" value="<c:out value='${sessionConfigVO.user_name }'/>" id="user_name"/>
				<c:if test="${sessionConfigVO ne null}">
				<ul style="height:30px;float:right;margin-bottom:20px;" class="fn-font">
					<li><a style="color:#f97088;text-decoration:none;" class="" >${sessionConfigVO.user_name}' s come in</a></li>
					<c:if test="${sessionConfigVO.naver_login eq true }">
						<li>
							<img src="../resources/images/naver_logo.png" style="width:30px;">
							<a style="color:green;">NAVER 계정으로 접속중 </a>
							<span id="count" class="badge bg-theme"></span>
						</li>
					</c:if>
				</ul>
				<div class="profile_div"><img src="<c:out value='${sessionConfigVO.profile_img}'/>" width=30 height=30/></div>
			</c:if>
			<c:if test='${sessionConfigVO eq null}'>
				<ul style="height:30px;float:right;margin-bottom:20px;" class="fn-font">
					<li><a style="color:blue;" class="forget_login" onclick="fn_forgetID()">Forget ID/PASSWORD</a></li>
				</ul>	
			</c:if>
			<span id="recMs" onclick="openNav()" name="recMs" style="float:right;cursor:pointer;margin-right:10px;color:pink;"><img src="../resources/images/msgicon.png" id="messageImage" style="opacity :0.3;width:15px;"></span>
		</div>
		<header class="menu_header">
			<h2 id="title_bar" style="display:inline;cursor:pointer;" onclick="location.href='/'">Education Site Comm</h2>
			<nav>
				<ul class="menu_ul">
					<c:if test="${sessionConfigVO eq null}">
						<li><a href="#" onclick="fn_join_modal();">Join</a></li>
						<li><a href="#" onclick="fn_login_modal();" id="login">Login</a></li>
					</c:if>
					<c:if test="${sessionConfigVO ne null}">
						<li><a href="/login/logout_proc">Logout</a></li>
						<li><a href="/update/update.do">Info</a></li>
					</c:if>
						<li><a href="">Propose</a></li>
						<li><a href="">Advertise</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="modal fade" id="JoinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header fn-font">
					<h2 style="text-align:center;" class="modal-title" id="exampleModalLabel">JOIN</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<form class="reg_form">
					<input type="hidden" id="flag" name="flag" value="add"/>
					<div class="modal-body fn-font">
						<table>
							<colgroup>
								<col style="width:100px;"/>
								<col style="width:px;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>ID</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_id" name="user_id" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>PW</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_pw" name="user_pw" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>NAME</th>
									<td><input type="text" style="margin-left:10%;width:200px;"  id="user_name" name="user_name" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>E-Mail</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_email" name="user_email" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>Phone</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_phone" name="user_phone" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>Age</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_age" name="user_age" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>Company</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_company" name="user_company" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>User Number</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="user_no" name="user_no" class="form-control" value="asd"/> </td>
								</tr>						
							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer fn-font">
					<button class="btn" type="button" id="join_submit">예</button>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header fn-font">
					<h2 style="text-align:center;" class="modal-title" id="exampleModalLabel">LOGIN</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<form class="login_form" method="post" action="/login/login_proc">
					<div class="modal-body fn-font">
						<table>
							<colgroup>
								<col style="width:100px;"/>
								<col style="width:px;"/>
							</colgroup>
							<tbody style="text-align:center;">
								<tr>
									<th>ID</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="login_user_id" name="user_id" class="form-control" value="asd"/> </td>
								</tr>
								<tr>
									<th>PW</th>
									<td><input type="text" style="margin-left:10%;width:200px;" id="login_user_pw" name="user_pw" class="form-control" value="asd"/> </td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer fn-font">
						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login">
							<a href="${url}">
								<img width="150" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
							</a>
							<a href="/main/kakao_login.ajax">
								<img width="150" height="33" src="../resources/images/kakao_login_btn.png"/>
							</a>
						</div>
						
						<br>
						<input type="submit" class="btn" id="login_submit" value="예"/>
						<button class="btn" type="button" data-dismiss="modal">아니요</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="ForgetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header fn-font">
					<h2 style="text-align:center;" class="modal-title" id="exampleModalLabel">FIND ID / PASSWORD</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<form class="forget_form">
					<input type="hidden" id="flag" name="flag" value="find"/>
					<div class="modal-body fn-font">
						<table>
							<colgroup>
								<col style="width:100px;"/>
								<col style="width:px;"/>
								<col style="width:100px;"/>
								<col style="width:px;"/>
							</colgroup>
							<tbody>
								<tr>
									<input type="email" class="form-control" id="forget_email" placeholder="email을 입력해주세요"/>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer fn-font">
					<button class="btn" type="button" id="forget_submit">찾기</button>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
	});
	function fn_forgetID(){
		$('#ForgetModal').modal("show");
	}

	function fn_join_modal(){
		$('#JoinModal').modal("show");
	}
	function fn_login_modal(){
		$('#LoginModal').modal("show");
	}
	
	$("#forget_submit").click(function(){
		$.ajax({
			url :"/lgoin/sendMail.do",
			data: {
				email : $("#forget_email").val(),
			},
			success:function(data){
				alert("메일을 발송했습니다.");
			}
		})
	})
	
	/*회원 등록 버튼*/
	$("#join_submit").click(function(){
		$.ajax({
			type: "post",
			url : "/join/reg_proc.ajax",
			dataType : "json",
			data : $(".reg_form").serialize(),
			success:function(data){
				alert("등록처리 되었습니다.");
			},
// 			error:function(jqXHR, textStatus, errorThrown){
// 				alert("사용자 등록 도중 오류 발생했습니다."+textStatus);
// 			}
		})
	});
	
	$(".menu_ul").mouseover(function(){
		$(".menu_header").css("text_decoration","under");
	});
</script>