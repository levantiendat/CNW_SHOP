<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="model.bean.HistoryDetail" %>
<%@page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History detail</title>
</head>
<body>
	<div style="background-color: #4CAF50; color: white; text-align: center; padding: 10px;">
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a>Cá nhân</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="CategoryServlet">Danh mục</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="ProductServlet?category=all">Sản phẩm</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="CartServlet?show=1">Giỏ hàng</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="HistoryServlet?detail=0">Lịch sử mua hàng</a></h2>
    </div>
    <table border="1">
		<tr>
			<th>Mã hàng hóa/hóa đơn</th>
			<th>Mã hàng hóa</th>
			<th>Số tiền thanh toán</th>
			<th></th>
		</tr>
		
	
	<%
		ArrayList<HistoryDetail> list = (ArrayList<HistoryDetail>) request.getAttribute("list");
		for(int i = 0;i<list.size();i++){	
			
	%>
		<tr>
			<td><%=list.get(i).getID() %></td>
			<td><%=list.get(i).getID_Product() %></td>
			<td><%=list.get(i).getPrice() %></td>
		</tr>
	<%} %>
	</table>
</body>
</html>