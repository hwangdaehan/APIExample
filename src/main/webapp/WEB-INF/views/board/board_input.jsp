<%@include file="../include_page/popupCommon.jsp" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<head>
</head>
<body>
		<input type="hidden" id="user_id" name="user_id" value="<c:out value='${sessionConfigVO.user_id}'/>"/>
		
		<div class="input_popup">
			<table>
				<colgroup>
					<col style="width : 150px;"/>
					<col style="width : 250px;"/>
					<col style="width : 150px;"/>
					<col style="width : 250px;"/>
				</colgroup>
				<thead>
					<tr>
						<th>
							<a class="fn_font">TITLE</a>
						</th>
						<th colspan="3">
							<input type="text" id="title" name="title" class="form-control" style="width:400px;"/> 
						</th>
					</tr>
					<tr>
						<th>
							<a class="fn_font">WRITER</a>
						</th>
						<th>
							<input type="text" id="writer" name="writer" value="<c:out value='${sessionConfigVO.user_name}'/>" class="form-control" style="width:200px;"/> 
						</th>
						<th colspan="2">
							<div class="filebox">
							  <label for="ex_file">FILE UPLOAD</label>
							  <input type="file" id="file_nm" name="file_nm"/>
							</div> 
						</th>
					</tr>
					<tr>
						<th>
							<a class="fn_font">CONTENT</a>
						</th>
						<th>	
							<div id="editor" name="content" style="box-sizing: border-box;width:403px;height:263px;">
							</div>
							<div id="viewer">
							</div>
						</th>
					</tr>
					<tr>
						<th>
							<a class="fn_font">PASSWORD </a>
						</th>
						<th>
							<input type="password" name="bd_password" id="bd_password" class="form-control"/>
						</th>
						<th colspan="2">
							<a class="fn_font">SEE A PASSWORD<input type="checkbox" name="password_view" id="password_view" class="form-control"/></a>
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="footer" style="float:right;margin-right:20px;">
				<input type="button" id="reg_btn" name="reg_btn" class="btn btn-primary" value="WRITE"/>
				<input type="button" id="cancel_btn" name="cancel_btn" onclick="window.close();" class="btn btn-danger" value="CLOSE"/> 
		</div>
	</body>
</html>
<script src="https://uicdn.toast.com/editor/2.0.0/toastui-editor-all.min.js"></script>
<script>
	$(document).ready(function(){
	});
	
 	const content = [].join('\n');

    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        initialEditType: "wysiwyg",
        initialValue: content
    });

    const viewer = toastui.Editor.factory({
        el: document.querySelector('#viewer'),
        viewer: true,
        initialValue: content
    });
    
    /*글 등록*/
    $("#reg_btn").click(function(){
    	var param =new Object();
    	param.title = $("#title").val();
    	param.writer = $("#writer").val();
    	param.bd_password = $("#bd_password").val();
    	param.content = $("#editor .tui-editor-contents").text();
    	param.user_id = $("#user_id").val();
    	//이미지 입력 필요
		//param.image!!
		//첨부파일 참조 필요
		//param.file_nm!!
    	param.flag ="add";
    	
    	var form = paramCreateForm(param);
    	$.ajax({
    		url : "/board/board_proc.ajax",
    		type : "post",
    		dataType : "json",
    		data : $(form).serialize(),
    		success:function(data){
    			console.log(data);
    			alert("정상처리되었습니다.");
    			opener.location.reload();
    			window.close();
    		}
    	})
    });
    
    
    
    //비밀번호 보기
    $("#password_view").click(function(){
    	if($("#bd_password").attr("type") =="password")
    		$("#bd_password").attr("type","text");
    	else
    		$("#bd_password").attr("type","password");
    })
</script>