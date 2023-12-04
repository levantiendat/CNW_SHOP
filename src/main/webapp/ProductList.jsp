<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="model.bean.Product" %>
<%@page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category list</title>
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
			<th>Mã mặt hàng</th>
			<th>Mã Loại hàng</th>
			<th>Tên hàng hóa</th>
			<th>Giá niêm yết</th>
			<th>Mức giảm giá</th>
			<th>Sau khi giảm</th>
			<th></th>
		</tr>
		
	
	<%
		ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
		for(int i = 0;i<list.size();i++){	
			double promotePercent =(double)- list.get(i).getPromotion()/list.get(i).getPrice()*100;
			String formattedPromotion = String.format("%.1f%%", promotePercent);
	%>
		<tr>
			<td><%=list.get(i).getID() %></td>
			<td><%=list.get(i).getID_Category() %></td>
			<td><%=list.get(i).getName() %></td>
			<td><%=list.get(i).getPrice() %></td>
			<td><%=formattedPromotion %></td>
			<td><%=list.get(i).getPrice() + list.get(i).getPromotion() %></td>
			<td><a href="CartServlet?add=1&ID=<%=list.get(i).getID() %>">Thêm</a></td>
		</tr>
	<%} %>
	</table>
</body>
</html>