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
String name=request.getParameter("name");
String dept=request.getParameter("dept");
String position=request.getParameter("position");
String duty=request.getParameter("duty");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
try{
	String sql="update info0721 set name=?,dept=?,position=?,duty=?,phone=?,address=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, id);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4, duty);
	pstmt.setString(5, phone);
	pstmt.setString(6, address);
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정 성공");
	location.href="select_info.jsp"
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>