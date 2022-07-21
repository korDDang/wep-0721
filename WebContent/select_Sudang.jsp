<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<br>
<h2>수당 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
	<th class="th2">no</th>
	<th class="th2">사원번호</th>
	<th class="th2">이름</th>
	<th class="th2">가족수당</th>
	<th class="th2">직책수당</th>
	<th class="th2">근속수당</th>
	<th class="th2">기타수당</th>
	<th class="th2">수당합계</th>
	<th class="th2">구 분</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("###,###");
int no=0;
int total=0;
try{
	String sql="select i.id,i.name,s.gajok,s.jikchak,s.gunsok,s.gitasudang from sudang0721 s, info0721 i where s.id=i.id";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		int gajok=rs.getInt(3);
		int jikchak=rs.getInt(4);
		int gunsok=rs.getInt(5);
		int gitasudang=rs.getInt(6);
		total=gajok+jikchak+gunsok+gitasudang;
		no++;
%>
<tr>
	<td class="td1"><%=no %></td>
	<td class="td1"><%=id %></td>
	<td class="td1"><%=name %></td>
	<td class="td2"><%=fo.format(gajok) %></td>
	<td class="td2"><%=fo.format(jikchak) %></td>
	<td class="td2"><%=fo.format(gunsok) %></td>
	<td class="td2"><%=fo.format(gitasudang) %></td>
	<td class="td2"><%=fo.format(total) %></td>
	<td class="td1">
	<a href="update_Sudang.jsp?id=<%=id%>">수정</a> /
	<a href="delete_Sudang.jsp?id=<%=id%>">삭제</a>
	</td>
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