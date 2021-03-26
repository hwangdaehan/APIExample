 <%@include file="include_page/header.jsp" %>    
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="../resources/js/sockjs.min.js"></script>
   <body>
	<div class="container">
		<section id="visual">
		</section>

		<section id="content">
			<div class="item">
				<div class="img" onclick="location.href='/board/main_board.do'" style="cursor:pointer;">
					<img src="../resources/images/board.png"/>
				</div>
				<div class="info">
					<h4 class="fn-font">게시판</h4>
					<p class="fn-font">
						게시판은 정말 기본 게시판 입니다. 
						너무 신기한 기본 게시판입니다. 
						DATATABLES GRID 라이브러리를 사용한 정말 기본 게시판입니다. 
					</p>
					<div class="button-row">
						<button class="btn fn-font btn-sm" id="board1">더 알아보기</button>
					</div>
				</div>
			</div>
			<div class="item">			
				<div class="img" onclick="location.href='craw/craw_main.do'">
					<img src="../resources/images/crawling.png">
				</div>
				<div class="info">
					<h4 class="fn-font">크롤링</h4>
					<p class="fn-font">
						크롤링은 좋은 기술입니다.
						자료를 모두모두 모아서 가져올겁니다.
						그래서 그래프로 보여줄겁니다.
						아주예쁘겠죠
						아무말이나 일단 적어봅시다.						
					</p>
					<div class="button-row">
						<button class="btn fn-font btn-sm" onclick="location.href='craw/craw_main.do'">더 알아보기</button>
					</div>
				</div>
			</div>
			<div class="item">
					<div id="map" class="img"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=155bce2e26c81a30e49f9e456912bb2d"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 8 // 지도의 확대 레벨 
				    }; 

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				var imageSrc = $(".profile_div img").attr("src"), // 마커이미지의 주소입니다    
			    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				
			        
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            message = '<div style="width:70px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
				        
				        // 마커와 인포윈도우를 표시합니다
				        displayMarker(locPosition, message);
				        
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
				    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				        message = 'geolocation을 사용할수 없어요..'
				        
				    displayMarker(locPosition, message);
				}

				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition, message) {

				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    var iwContent = message, // 인포윈도우에 표시할 내용
				        iwRemoveable = true;

				    // 인포윈도우를 생성합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });
				    
				    // 인포윈도우를 마커위에 표시합니다 
				    infowindow.open(map, marker);
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}    
					</script>
				<div class="info">
					<h4 class="fn-font">미리보기3</h4>
					<p class="fn-font">
						레벨의 디자인은 플레이어의 경험을 만드는 작업입니다.
						이곳에는 아무말이나 채워넣어야만합니다. 
						그래야만 그럴듯해 보입니다. 더미 텍스트를 넣어봅시다. 
					</p>
					<div class="button-row">
						<button class="btn fn-font btn-sm">더 알아보기</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	<form id="chatForm">
		<div class="chat_start_main">
			상담 CHAT
		</div>
		<div class="chat_main" style="display:none;">
			<div class="modal-header" style="height:20%;">
				상담 CHAT 
			</div>
			<div class="modal-content" id="chat" style="height:60%;">
				
			</div>
			<div class="modal-footer">
				<input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>	
			</div>
		</div>
<!-- 		<button class="">send</button> -->
	</form> 
	
	<div id="mysidenav" class="sidenav">
		<div id="mssage_send_btn" name="mssage_send_btn" class="btn btn-warning"><p style="color:white;">쪽지 보내기</p></div>
		<div id="sideContentArea">
			<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		</div>
	</div>
	
	<div class="modal fade" id="MsgForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header fn-font">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<form class="msg_form">
					<input type="hidden" id="flag" name="flag" value="insert"/>
					<input type="hidden" id="user_id" name="user_id" value="${sessionConfigVO.user_id}"/>
					<div class="modal-body fn-font">
						<table>
							<colgroup>
								<col style="width:150px;"/>
								<col style="width:px;"/>
							</colgroup>
							<tbody>
								<tr>
									<th>작성자</th>
									<th><input type="text" id="sender_name" name="sender_name" class="form-control" value="<c:out value='${sessionConfigVO.user_name}'/>" readonly/></th>
								</tr>
								<tr>
									<th>받는 사람</th>
									<th>
										<select id="receiver_name" name="receiver_name" class="form-control" value="">
											<c:forEach var="row" items="${userList}" varStatus="status">
												<option value="${row.user_name}">${row.user_name}</option>
											</c:forEach>
										</select>
									</th>
								</tr>
								<tr>
									<th>제목</th>
									<th><input type="text" id="ms_title" name="ms_title" class="form-control" value=""/></th>
									
								</tr>
								<tr>
									<th>내용</th>
									<th><textArea id="ms_content" name="ms_content" class="form-control"></textArea></th>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="modal-footer fn-font">
					<button class="btn" type="button" id="msg_submit">SEND</button>
					<button class="btn" type="button" data-dismiss="modal">NO</button>
				</div>
			</div>
		</div>
	</div>
</body>     
<script type="text/javascript">
var socket = null;
var sock = new SockJS("/echo");
socket =sock;
$(document).ready(function(){
	$("#chatForm").submit(function(event){
		event.preventDefault();
			sock.send($("#message").val());
			$("#message").val('').focus();	
	});	
	
	if(!isEmpty($("#session_id").val()))
			connectWS();
});
	$(".chat_start_main").click(function(){
		$(this).css("display","none");
		$(".chat_main").css("display","inline");
	})
	$(".chat_main .modal-header").click(function(){
		$(".chat_start_main").css("display","inline");
		$(".chat_main").css("display","none");
	});

	function connectWS(){
		sock.onopen = function() {
		       console.log('info: connection opened.');
		};
		sock.onmessage = function(e){
			var splitdata =e.data.split(":");
			if(splitdata[0].indexOf("recMs") > -1){
				$("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
				$("#messageImage").animate({
					opacity : 1
				},1000);
			}
			else{
				$("#chat").append(e.data + "<br/>");
			}
		}
		sock.onclose = function(){
			$("#chat").append("연결 종료");
// 			 setTimeout(function(){conntectWs();} , 10000); 
		}
		sock.onerror = function (err) {console.log('Errors : ' , err);};

	}
	
	$("#board1").click(function(){
		location.href="/board/main_board.do";
	});

	function openNav() {
		document.getElementById('mysidenav').style.width = '350px';
		$.ajax({
			type:"post",
			dataType:"json",
			url:"/message/list.do",
			data :{
				receiver_name : $("#user_name").val(),
			},
			success:function(data){
				var dataset = data.result;
				dataset.forEach(function(row){
					if($("#"+row.view_check).length >0){
					}else{
						$("#mysidenav #sideContentArea").append("<div id='"+row.view_check+"'class='letter'><div class='header'><p style='color:white;font-size:23px;margin-left: 20px;'>"+row.ms_title+"</p></div><table><tbody><tr><th>발송일자:  "+row.creat_dt+"</th><th>발송자: "+row.sender_name+"</th></tr>"+   
								   "<tr><th>"+row.ms_content+"</th></tr></tbody></table><div class='footer'></div></div>");
				
						if(row.read_yn ==0)
								$("#"+row.view_check+" .footer").append("<input type='button' style='float:right;' id='letter_read' class='btn btn-danger' value='read'/>");
						else
							$("#"+row.view_check+" .header p").append("<input type='button' style='float:right;' id='letter_delete' class='btn btn-primary btn-xs' value='삭제'/><span style='float:right;color:white;font-size:10px;'>읽음</span>");
						
					}
				});
			}
		})
		if($("#mysidenav").css("width") =="350px")
			document.getElementById('mysidenav').style.width = '0';
			
	}
	function closeNav() {
		document.getElementById('mysidenav').style.width = '0';
	}
	
	
	$("#mssage_send_btn").click(function(){
		$('#MsgForm').modal("show");
	});
	$("#msg_submit").click(function(){
		var msg= "쪽지를 보낼래?";
		
		if(!confirm(msg))
			return false;
		
		$.ajax({
			url : "/message/message_proc.do",
			dataType : "json",
			type : "post",
			data : $(".msg_form").serialize(),
			success:function(data){
				alert("쪽지를 보냈습니다.");	
				$('#MsgForm').modal("hide");
			}
		})
	});
	$(document).on("click","#letter_read", function(){
		$.ajax({
			url :"/message/message_proc.do",
			dataType :"json",
			type : "post",
			data : {
				view_check : $(this).parent().parent().attr("id"),
				flag : "updateViewCheck",
			},
			success:function(data){
			}
		})
	});
	$(document).on("click","#letter_delete", function(){
		$.ajax({
			url :"/message/message_proc.do",
			dataType :"json",
			type : "post",
			data : {
				view_check : $(this).parent().parent().parent().attr("id"),
				flag : "letterDelete",
			},
			success:function(data){
				alert("삭제 되었습니다.");
				window.location.reload();
			}
		})
	});
</script>
    
    