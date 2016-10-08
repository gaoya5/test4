<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>success</title>
	</head>
	<body>
		<h3>成功页面</h3>
		${requestScope.user2.id}
		${requestScope.user2.name}
		
		${sessionScope.user2.id }
		${sessionScope.user2.name }
	</body>
</html>