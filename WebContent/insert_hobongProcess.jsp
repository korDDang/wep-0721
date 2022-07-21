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
String dunggub=request.getParameter("dunggub");
String salary=request.getParameter("salary");

try{
	String sql="insert into hobong0721 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	pstmt.setString(2, salary);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 성공");
	location.href="select_hobong.jsp"
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>