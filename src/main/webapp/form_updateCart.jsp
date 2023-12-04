<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="model.bean.Cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update number of cart</title>
</head>
<body>
	<div style="background-color: #4CAF50; color: white; text-align: center; padding: 10px;">
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a>Cá nhân</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="CategoryServlet">Danh mục</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="ProductServlet?category=all">Sản phẩm</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="CartServlet?show=1">Giỏ hàng</a></h2>
        <h2 style="display: inline-block; margin: 0; padding: 10px;"><a href="HistoryServlet?detail=0">Lịch sử mua hàng</a></h2>
    </div>
	<%
		Cart cart = (Cart) request.getAttribute("cart");
	%>
	<form method="get" action="CartServlet">
		<input type="hidden" name="update" value="1">
		Mã mặt hàng: <input type="text" name="ID_Product" value = <%=cart.getID() %> readonly><br>
		Tên mặt hàng: <input type="text" name="Product_name" value = <%=cart.getName() %> readonly><br>
		Giá sau khi giảm: <input type="text" name="Product_Price" value = <%=cart.getPrice() + cart.getPromotion() %> readonly><br>
		Số lượng: <input type="text" name="Product_num" value = <%=cart.getNumber() %>> <br>
		<input type="submit" name="ok" value="ok">
	</form>
</body>
</html>