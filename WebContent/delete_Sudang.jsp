<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String id=request.getParameter("id");


try{
	String sql="delete from sudang0721 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);

	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제 성공");
	location.href="select_Sudang.jsp"
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>