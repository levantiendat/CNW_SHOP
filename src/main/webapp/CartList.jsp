<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bean.Cart" %>
		<%@page language="java" import="java.util.ArrayList" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<title>Cart list</title>
			</head>

			<body>
				<div class="container-fluid">
					<div class="wrapper w-100 overflow-auto">
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
									<th>Mã mặt hàng</th>
									<th>Tên hàng hóa</th>
									<th>Giá niêm yết</th>
									<th>Mức giảm giá</th>
									<th>Sau khi giảm</th>
									<th>Số lượng</th>
									<th>Thành tiền</th>
									<th></th>
									<th></th>
								</tr>
								<% int billing=0; ArrayList<Cart> list = (ArrayList<Cart>) request.getAttribute("list");
										for(int i = 0;i<list.size();i++){ double promotePercent=(double)-
											list.get(i).getPromotion()/list.get(i).getPrice()*100; String
											formattedPromotion=String.format("%.1f%%", promotePercent); int
											total=(list.get(i).getPrice() +
											list.get(i).getPromotion())*list.get(i).getNumber(); billing+=total; %>
											<tr>
												<td>
													<%=list.get(i).getID() %>
												</td>
												<td>
													<%=list.get(i).getName() %>
												</td>
												<td>
													<%=list.get(i).getPrice() %>
												</td>
												<td>
													<%=formattedPromotion %>
												</td>
												<td>
													<%=list.get(i).getPrice() + list.get(i).getPromotion() %>
												</td>
												<td>
													<%=list.get(i).getNumber() %>
												</td>
												<td>
													<%=total %>
												</td>
												<td>

													<a class="btn btn-primary"
														href="CartServlet?update=0&ProductID=<%=list.get(i).getID() %>">ChangeNumber</a>

												</td>
												<td>

													<a class="btn btn-primary"
														href="CartServlet?delete=1&ProductID=<%=list.get(i).getID() %>">Delete</a>

												</td>
											</tr>
											<%} %>
							</table>
							<p class="text-light fs-3">Your bill in a stock is: <%=billing %> VNĐ</p>
							<a href="HistoryServlet"><button class="btn btn-dark btn-lg">Thanh toán</button></a>
						</div>

					</div>
				</div>
			</body>

			</html>