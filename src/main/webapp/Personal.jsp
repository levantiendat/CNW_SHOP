<%@page import="model.dao.AccountDAO" %>
	<%@page import="java.util.ArrayList" %>
		<%@page language="java" import="model.bo.AccountBO" %>
			<%@page language="java" import="model.bean.Account" %>
				<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="utf-8">
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
						<div class="container-fluid">
							<div class="wrapper w-100 overflow-hidden">
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
								<div class="row bg-secondary vh-100">
									<div class="col col-3">
									</div>
									<div class="col col-6 d-flex justify-content-start align-items-center flex-column">
										<h1 class="text-center mb-5 mt-5 text-light">Personal detail</h1>
										<div style="width: 80%; margin-top:20px;">
											<% Account acc=(Account)request.getAttribute("account"); %>
												<form action="PersonalServlet"
													class="LoginForm d-flex justify-content-center align-items-center flex-column"
													style="font-size: 20px;" method="post">
													<div
														class="d-flex justify-content-between align-items-center mb-5 border-bottom border-light w-100">
														<label for="Username" class="form-label text-light"
															style="font-weight:bold; margin:0;">Username</label>
														<input type="text" class="form-control bg-secondary text-light"
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
														<input type="text" class="form-control bg-secondary text-light"
															id="Name" name="Name" aria-describedby="nameHelp"
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
															value="SuaThongTin" style="width:40%; font-size:16px;">Sửa
															thông
															tin
														</button>
														<button type="button" class="btn btn-primary" style="width:40%;"
															onclick="Cancel()">Hủy</button>
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
						</script>
					</body>

					</html>