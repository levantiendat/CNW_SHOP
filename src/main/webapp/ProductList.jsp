<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bean.Product" %>
		<%@page language="java" import="java.util.ArrayList" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="utf-8">
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<title>Product list</title>
			</head>

			<body>
				<% session=request.getSession(); int roles=(int) session.getAttribute("roles"); if(roles!=0 &&
					roles!=1){ response.sendRedirect("PersonalServlet?logout=1"); } %>
					<div class="container-fluid">
						<div class="wrapper w-100">
							<nav class="navbar navbar-expand-lg bg-dark navbar-dark d-flex justify-content-center border-bottom border-body"
								data-bs-theme="dark" style="font-size: 22px; font-weight: bold;">
								<div class="container-fluid">
									<div class="collapse navbar-collapse" id="navbarScroll">
										<ul class="navbar-nav"
											style="display: flex; justify-content: space-evenly; align-items:center; width: 70%">
											<li class="nav-item">
												<a class="nav-link" href="PersonalServlet?method=show">Cá nhân</a>
											</li>
											<%if(roles==1) {%>
												<li class="nav-item">
													<a class="nav-link" href="PersonalServlet?all=1">Quản lý User</a>
												</li>
												<%} %>
													<li class="nav-item">
														<a class="nav-link" href="CategoryServlet">Danh mục</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" href="ProductServlet?category=all">Sản
															phẩm</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" href="CartServlet?show=1">Giỏ hàng</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" href="HistoryServlet?detail=0">Lịch sử mua
															hàng</a>
													</li>
													<li class="nav-item">
														<a class="nav-link" href="PersonalServlet?logout=1">Đăng
															xuất</a>
													</li>
										</ul>
										<ul class="navbar-nav"
											style="display: flex; justify-content: end; align-items:center;">
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle FindProductHref" href="#"
													id="navbarDropdown" role="button" data-bs-toggle="dropdown"
													aria-expanded="false">Tìm kiếm</a>
												<ul class="dropdown-menu dropdown-menu-dark"
													aria-labelledby="navbarDropdown">
													<li><a class="dropdown-item" href="#" id="FindNameProduct">Tên sản
															phẩm</a></li>
													<li><a class="dropdown-item" href="#" id="FindPriceProduct">Giá
															thành</a></li>
													<%if(roles==1) {%>
														<li class="nav-item">
															<a class="dropdown-item" href="#"
																id="FindUserByUsername">Username</a>
														</li>
														<li class="nav-item">
															<a class="dropdown-item" href="#" id="FindUserByName">Tên
																user</a>
														</li>
														<%} %>
												</ul>
											</li>
										</ul>
										<form class="d-flex" role="search" method="post" action="ProductServlet"
											id="FindForm">
											<input class="form-control me-2 w-auto" type="search" placeholder="Search"
												name="Value" aria-label="Search" id="SearchValue">
											<input type="submit" class="btn btn-outline-success" name="method"
												value="Search" id="SubmitFindProduct">
										</form>
									</div>
								</div>
							</nav>
							<div class="content w-100 bg-secondary p-5 vh-100" style="overflow-y:auto;">
								<%if(roles==1){ %>
									<div class="d-flex justify-content-start">
										<a class="btn btn-primary" href="ProductServlet?method=add">Thêm</a>
									</div>
									<%} %>
										<table class="table table-dark table-striped w-100 mt-2">
											<tr>
												<th>Mã mặt hàng</th>
												<th>Mã Loại hàng</th>
												<th>Tên hàng hóa</th>
												<th>Giá niêm yết</th>
												<th>Mức giảm giá</th>
												<th>Sau khi giảm</th>
												<th></th>
												<%if(roles==1){ %>
													<th></th>
													<th></th>
													<%} %>
											</tr>


											<% ArrayList<Product> list = (ArrayList<Product>)
													request.getAttribute("list");
													for(int i = 0;i<list.size();i++){ double promotePercent=(double)-
														list.get(i).getPromotion()/list.get(i).getPrice()*100; String
														formattedPromotion=String.format("%.1f%%", promotePercent); %>
														<tr>
															<td>
																<%=list.get(i).getID() %>
															</td>
															<td>
																<%=list.get(i).getID_Category() %>
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
																<%=list.get(i).getPrice() + list.get(i).getPromotion()
																	%>
															</td>
															<td>
																<a class="btn btn-primary"
																	href="CartServlet?add=1&ID=<%=list.get(i).getID() %>">Thêm
																	vào giỏ hàng</a>
															</td>
															<%if(roles==1) {%>
																<td>
																	<a class="btn btn-primary"
																		href="ProductServlet?method=update&ID=<%=list.get(i).getID() %>">Sửa</a>

																</td>
																<td>
																	<a class="btn btn-primary"
																		href="ProductServlet?method=del&ID=<%=list.get(i).getID() %>">Xóa</a>
																</td>
																<%} %>
														</tr>
														<%} %>
										</table>

							</div>
						</div>
						<% String message=(String)request.getAttribute("message"); if(message==null) message="" ;%>
							<script>
								if ('<%=message %>' != "") alert('<%=message %>');
								const FindProductHref = document.querySelector(".FindProductHref");
								const FindNameProduct = document.getElementById("FindNameProduct");
								const FindPriceProduct = document.getElementById("FindPriceProduct");
								const FindUserByUsername = document.getElementById("FindUserByUsername");
								const FindUserByName = document.getElementById("FindUserByName");
								const FindForm = document.getElementById("FindForm");
								const SubmitFindProduct = document.getElementById("SubmitFindProduct");
								FindNameProduct.addEventListener("click", (e) => {
									e.preventDefault();
									FindProductHref.innerHTML = "Tìm kiếm theo tên sản phẩm";
								});
								FindPriceProduct.addEventListener("click", (e) => {
									e.preventDefault();
									FindProductHref.innerHTML = "Tìm kiếm theo giá thành";
								});
								if (FindUserByUsername != null) {
									FindUserByUsername.addEventListener("click", (e) => {
										e.preventDefault();
										FindProductHref.innerHTML = "Tìm kiếm theo username";
									});
								}
								if (FindUserByName != null) {
									FindUserByName.addEventListener("click", (e) => {
										e.preventDefault();
										FindProductHref.innerHTML = "Tìm kiếm theo tên user";
									});
								}
								SubmitFindProduct.addEventListener("click", (e) => {
									const Search = document.getElementById("SearchValue");
									if (Search.value == "") {
										alert("Bạn chưa nhập thông tin tìm kiếm");
										e.preventDefault();
									}
									else if (FindProductHref.textContent == "Tìm kiếm") {
										alert("Bạn chưa chọn mục cần tìm kiếm");
										e.preventDefault();
									}
									else {

										if (FindProductHref.textContent == "Tìm kiếm theo tên sản phẩm") {
											SubmitFindProduct.value = "FindProductByName";
										}
										else if (FindProductHref.textContent == "Tìm kiếm theo giá thành") {
											const PriceRe = new RegExp('^[0-9]+$');
											if (!PriceRe.test(Search.value)) {
												alert("Giá thành phải là số");
												e.preventDefault();
											}
											SubmitFindProduct.value = "FindProductByPrice";
										}
										else if (FindProductHref.textContent == "Tìm kiếm theo username") {
											FindForm.setAttribute("action", "PersonalServlet");
											SubmitFindProduct.value = "FindUserByUsername";
										}
										else if (FindProductHref.textContent == "Tìm kiếm theo tên user") {
											FindForm.setAttribute("action", "PersonalServlet");
											SubmitFindProduct.value = "FindUserByName";
										}
									}
								});
							</script>
			</body>

			</html>