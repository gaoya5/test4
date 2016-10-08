<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body> 
		<input type="file" name="myfile" id="myfile" /><br>
		<button id="upload">上传</button><br>
		<div id="files"></div>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="js/ajaxfileupload.js"></script>	
		<script type="text/javascript">
			$(function(){
				$("#upload").click(function(){
					var myfile = $("#myfile").val();
					if(myfile != ""){
						$.ajaxFileUpload({
							url : "ajaxUpload.do",
							fileElementId : "myfile",
							dataType : "text/html",
							success : function(data){
								alert("success");
								data = data.substring(1,data.length-1);
								alert("data--->"+data);
								$("#files").append("<img src='file/"+data+"'></image>");
							},
							error : function(xmlHttp,result){
								alert("error");
							}
						});
					}else{
						alert("请选择一个文件上传！");
					}
				});
			});		
		</script>
	</body>
</html>