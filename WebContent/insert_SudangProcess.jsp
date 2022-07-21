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
String gajok=request.getParameter("gajok");
String jikchak=request.getParameter("jikchak");
String gunsok=request.getParameter("gunsok");
String gitasudang=request.getParameter("gitasudang");

try{
	String sql="insert into sudang0721 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, gajok);
	pstmt.setString(3, jikchak);
	pstmt.setString(4, gunsok);
	pstmt.setString(5, gitasudang);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 성공");
	location.href="select_Sudang.jsp"
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>