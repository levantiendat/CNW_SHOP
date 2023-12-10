<%@page import="model.dao.AccountDAO" %>
	<%@page import="java.util.ArrayList" %>
		<%@page language="java" import="model.bo.AccountBO" %>
			<%@page language="java" import="model.bean.Account" %>
				<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="utf-8">
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
							rel="stylesheet">
						<script
							src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
						<title>Personal List</title>

					</head>

					<body>
						<% session=request.getSession(); int roles=(int) session.getAttribute("roles"); if(roles!=0 &&
							roles!=1){ response.sendRedirect("PersonalServlet?logout=1"); } %>
							<div class="container-fluid">
								<div class="wrapper w-100 overflow-hidden">
									<nav class="navbar navbar-expand-lg bg-dark navbar-dark d-flex justify-content-center border-bottom border-body"
										data-bs-theme="dark" style="font-size: 22px; font-weight: bold;">
										<div class="container-fluid">
											<div class="collapse navbar-collapse" id="navbarScroll">
												<ul class="navbar-nav"
													style="display: flex; justify-content: space-evenly; align-items:center; width: 70%">
													<li class="nav-item">
														<a class="nav-link" href="PersonalServlet?method=show">Cá
															nhân</a>
													</li>
													<%if(roles==1) {%>
														<li class="nav-item">
															<a class="nav-link" href="PersonalServlet?all=1">Quản lý
																User</a>
														</li>
														<%} %>
															<li class="nav-item">
																<a class="nav-link" href="CategoryServlet">Danh mục</a>
															</li>
															<li class="nav-item">
																<a class="nav-link"
																	href="ProductServlet?category=all">Sản
																	phẩm</a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="CartServlet?show=1">Giỏ
																	hàng</a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="HistoryServlet?detail=0">Lịch
																	sử mua
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
															<li><a class="dropdown-item" href="#"
																	id="FindNameProduct">Tên sản
																	phẩm</a></li>
															<li><a class="dropdown-item" href="#"
																	id="FindPriceProduct">Giá
																	thành</a></li>
															<%if(roles==1) {%>
																<li class="nav-item">
																	<a class="dropdown-item" href="#"
																		id="FindUserByUsername">Username</a>
																</li>
																<li class="nav-item">
																	<a class="dropdown-item" href="#"
																		id="FindUserByName">Tên
																		user</a>
																</li>
																<%} %>
														</ul>
													</li>
												</ul>
												<form class="d-flex" role="search" method="post" action="ProductServlet"
													id="FindForm">
													<input class="form-control me-2 w-auto" type="search"
														placeholder="Search" name="Value" aria-label="Search">
													<input type="submit" class="btn btn-outline-success" name="method"
														value="Search" id="SubmitFindProduct">
												</form>
											</div>
										</div>
									</nav>
									<div class="row bg-secondary vh-100">
										<div class="col col-3">
										</div>
										<div
											class="col col-6 d-flex justify-content-start align-items-center flex-column">
											<h1 class="text-center mb-5 mt-5 text-light">Personal detail</h1>
											<div style="width: 80%; margin-top:20px;">
												<% Account acc=(Account)request.getAttribute("account"); %>
													<form action="PersonalServlet" accept-charset="UTF-8"
														class="LoginForm d-flex justify-content-center align-items-center flex-column"
														style="font-size: 20px;" method="post">
														<div
															class="d-flex justify-content-between align-items-center mb-5 border-bottom border-light w-100">
															<label for="Username" class="form-label text-light"
																style="font-weight:bold; margin:0;">Username</label>
															<input type="text"
																class="form-control bg-secondary text-light"
																id="Username" name="Username"
																aria-describedby="usernameHelp" readonly
																value="<%=acc.getUsername()%>" style="border: none;
					outline: none;
					font-size: 20px; text-align:right;">
															<div id="usernameHelp" class="form-text"></div>
														</div>
														<div
															class="d-flex justify-content-between align-items-center mb-5 border-bottom border-light w-100">
															<label for="Name" class="form-label me-auto text-light"
																style="font-weight:bold; margin:0;">Name</label>
															<input type="text"
																class="form-control bg-secondary text-light" id="Name"
																name="Name" aria-describedby="nameHelp"
																value="<%=acc.getName()%>" style="border: none;
					outline: none;
					font-size: 20px; text-align:right;">
															<div id="nameHelp" class="form-text"></div>
														</div>
														<div
															class="d-flex justify-content-between align-items-center mb-5 border-bottom border-light w-100">
															<label for="Gmail" class="form-label flex-grow-1 text-light"
																style="font-weight:bold; margin:0;">Gmail</label>
															<input type="text"
																class="form-control flex-grow-1 bg-secondary text-light"
																id="Gmail" name="Gmail" aria-describedby="GmailHelp"
																value="<%=acc.getEmail()%>" style="border: none;
					outline: none;
					font-size: 20px; text-align:right;">
															<div id="GmailHelp" class="form-text"></div>
														</div>
														<div
															class="w-100 mt-5 d-flex justify-content-evenly align-items-center">
															<button type="submit" class="btn btn-primary" name="Submit"
																value="SuaThongTin"
																style="width:40%; font-size:16px;">Sửa
																thông
																tin
															</button>
															<button type="button" class="btn btn-primary"
																style="width:40%;" onclick="Cancel()">Hủy</button>
														</div>
													</form>
											</div>
										</div>
										<div class="col col-3">

										</div>

									</div>

								</div>
							</div>
							<script>
								function Cancel() {
									const Name = document.getElementById("Name")
									const Gmail = document.getElementById("Gmail")
									Name.value = "<%= acc.getName() %>"
									Gmail.value = "<%= acc.getEmail()%>"
								}
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
								FindUserByUsername.addEventListener("click", (e) => {
									e.preventDefault();
									FindProductHref.innerHTML = "Tìm kiếm theo username";
								});
								FindUserByName.addEventListener("click", (e) => {
									e.preventDefault();
									FindProductHref.innerHTML = "Tìm kiếm theo tên user";
								});
								SubmitFindProduct.addEventListener("click", (e) => {
									const Search = document.querySelector(".form-control");
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