<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../include_page/header.jsp" %>  
 <div class="craw">
	 <input type="text" id="craw_id" name="craw_id" class="form-control" placeholder="ID 입력" style="width:300px;"/>
	 <input type="button" id="craw_submit" name="craw_submit" class="btn btn-warning" value="조회"/>  
 </div>
 <div class="content_craw">
 </div>
 
 <div class="container"> 
 	<canvas id="myChart"></canvas> 
 </div>
  <!-- 차트 링크 --> 
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
 		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	 var ctx = $('#myChart'); // jQuery 사용
	 var myChart = new Chart(ctx,{ 
		 type: 'bar', 
		 data: { 
			 labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'], 
			 datasets: [
				 { label: '# of Votes', data: [12, 19, 3, 5, 2, 3], 
				   backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)' ], 
				   borderColor: [ 'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ], 
				   borderWidth: 1 }] 
	 	 }, 
	 	 options: { 
	 		 scales: { 
	 			 yAxes: [{ 
	 				 ticks: { beginAtZero: true } 
	 			 }] 
	 	 	} 
	 	 } 
	 	 });

 });
 	$("#craw_submit").click(function(){
 		$.ajax({
 			url :"/craw/craw_select.ajax",
 			data :{
 				user_id : $("#craw_id").val(),
 			},
 			dataType : "json",
 			type : "post",
 			success:function(data){
 				var data= data.NameResult;
				console.log(data.NameResult);
				console.log(data.PlayedResult);
 				$(".content_craw").append("<tr><th>"+data.NameResult+"</th><th>"+data.PlayedResult+"</th></tr>");	
 				
 			}
 		})
 	})
 </script>