<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bean.History" %>
		<%@page language="java" import="java.util.ArrayList" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<title>History List</title>
			</head>

			<body>
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
						<div class="content w-100 bg-secondary p-5 vh-100" style="overflow-y:auto;">
							<table class="table table-dark table-striped w-100 mt-2">
								<tr>
									<th>Mã thanh toán</th>
									<th>Ngày mua hàng</th>
									<th>Số tiền thanh toán</th>
									<th></th>
								</tr>
								<% ArrayList<History> list = (ArrayList<History>) request.getAttribute("list");
										for(int i = 0;i<list.size();i++){ %>
											<tr>
												<td>
													<%=list.get(i).getID() %>
												</td>
												<td>
													<%=list.get(i).getDateOfBill() %>
												</td>
												<td>
													<%=list.get(i).getBill() %>
												</td>
												<td><a
														href="HistoryServlet?detail=1&ID=<%=list.get(i).getID() %>">DETAIL</a>
												</td>
											</tr>
											<%} %>
							</table>
						</div>
					</div>
				</div>
			</body>

			</html>