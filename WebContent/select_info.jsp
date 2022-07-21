<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<br>
<h2>사원 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
	<th class="th2">no</th>
	<th class="th2">성명</th>
	<th class="th2">사번</th>
	<th class="th2">직급</th>
	<th class="th2">직책</th>
	<th class="th2">연락처</th>
	<th class="th2">소속부서</th>
	<th class="th2">주소</th>
</tr>
<%
int no=0;
try{
	String sql="select * from info0721";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		switch(dept){
		case "10" : dept="인사부";
			break;
		case "20" : dept="기획부";
		break;
		case "30" : dept="홍보부";
		break;
		case "40" : dept="영업부";
		break;
		case "50" : dept="경리부";
		break;
		}
		String position=rs.getString(4);
		String duty=rs.getString(5);
		String phone=rs.getString(6);
		String address=rs.getString(7);
		no++;
%>
<tr>
	<td><%=no %></td>
	<td><a href="update_info.jsp?id=<%=id %>"><%=id %></a></td>
	<td><%=name %></td>
	<td><%=position %></td>
	<td><%=duty %></td>
	<td><%=phone %></td>
	<td><%=dept %></td>
	<td><%=address %></td>
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