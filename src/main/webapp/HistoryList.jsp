<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bean.History" %>
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
				<title>History List</title>
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
																id="FindUserName">Username</a>
														</li>
														<li class="nav-item">
															<a class="dropdown-item" href="#" id="Find">Tên user</a>
														</li>
														<%} %>
												</ul>
											</li>
										</ul>
										<form class="d-flex" role="search" method="post" action="ProductServlet"
											id="FindForm">
											<input class="form-control me-2 w-auto" type="search" placeholder="Search"
												name="Value" aria-label="Search">
											<input type="submit" class="btn btn-outline-success" name="method"
												value="Search" id="SubmitFindProduct">
										</form>
									</div>
								</div>
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
											for(int i = 0;i<list.size();i++){ String ID_Username=list.get(i).getID()+"_"
												+ list.get(i).getUsername(); %>
												<tr>
													<td>
														<%=ID_Username %>
													</td>
													<td>
														<%=list.get(i).getDateOfBill() %>
													</td>
													<td>
														<%=list.get(i).getBill() %>
													</td>
													<td><a class="btn btn-primary"
															href="HistoryServlet?detail=1&ID=<%=list.get(i).getID() %>">DETAIL</a>
													</td>
												</tr>
												<%} %>
								</table>
							</div>
						</div>
					</div>
					<script>
						const FindProductHref = document.querySelector(".FindProductHref");
						const FindNameProduct = document.getElementById("FindNameProduct");
						const FindPriceProduct = document.getElementById("FindPriceProduct");
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
							}
						});
					</script>
			</body>

			</html>