<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉 정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<br>
<h2>호봉 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
	<th class="th2">no</th>
	<th class="th2">등급</th>
	<th class="th2">급여</th>
</tr>
<%
int no=0;
try{
	String sql="select * from hobong0721";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String dunggub=rs.getString(1);
		String dunggub2=rs.getString(1);
		switch(dunggub2){
		case "1" : dunggub2="1급";
		break;
		case "2" : dunggub2="2급";
		break;
		case "3" : dunggub2="3급";
		break;
		case "4" : dunggub2="4급";
		break;
		case "5" : dunggub2="5급";
		break;
		}
		String salary=rs.getString(2);
		no++;
%>
<tr>
	<td><%=no %></td>
	<td><a href="update_hobong.jsp?dunggub=<%=dunggub %>"><%=dunggub2 %></a></td>
	<td><%=salary %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>