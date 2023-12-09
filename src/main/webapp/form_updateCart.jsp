<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bean.Cart" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<title>Update number of cart</title>
		</head>

		<body>
			<%
				session = request.getSession();
				int roles = (int) session.getAttribute("roles");
				if(roles!=0 && roles!=1){
					response.sendRedirect("PersonalServlet?logout=1");
				}
			%>
			<div class="container-fluid">
				<div class="wrapper w-100">
					<nav class="navbar navbar-expand-lg bg-dark navbar-dark d-flex justify-content-center"
						style="font-size: 22px; font-weight: bold;">
						<ul class="navbar-nav"
							style="display: flex; justify-content:space-evenly; align-items:center; width: 60%">
							<li class="nav-item">
								<a class="nav-link" href="PersonalServlet?method=show">Cá nhân</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="CategoryServlet">Danh mục</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="ProductServlet?category=all">Sản phẩm</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="CartServlet?show=1">Giỏ hàng</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="HistoryServlet?detail=0">Lịch sử mua
									hàng</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="">Đăng xuất</a>
							</li>
						</ul>
					</nav>
					<% Cart cart=(Cart) request.getAttribute("cart"); %>
						<form method="get" action="CartServlet">
							<input type="hidden" name="update" value="1">
							Mã mặt hàng: <input type="text" name="ID_Product" value=<%=cart.getID() %> readonly><br>
							Tên mặt hàng: <input type="text" name="Product_name" value=<%=cart.getName() %>
							readonly><br>
							Giá sau khi giảm: <input type="text" name="Product_Price" value=<%=cart.getPrice() +
								cart.getPromotion() %> readonly><br>
							Số lượng: <input type="text" name="Product_num" value=<%=cart.getNumber() %>> <br>
							<input type="submit" name="ok" value="ok">
						</form>
				</div>
			</div>
		</body>

		</html>