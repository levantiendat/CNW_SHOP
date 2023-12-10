<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page language="java" import="model.bo.AccountBO" %>
		<%@page language="java" import="model.bean.Account" %>
			<%@page language="java" import="java.util.ArrayList" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
						rel="stylesheet">
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
					<link rel="stylesheet"
						href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
					<title>Add account</title>
				</head>

				<body>
					<div class="container">
						<div class="wrapper">
							<div class="row mt-3">
								<div class="col col-sm-3"></div>
								<div class="col col-sm-6 bg-light rounded-4" style="padding: 30px 60px;">
									<h1 class="text-center mb-5 mt-1">Add new account</h1>
									<% ArrayList<String> list = (ArrayList<String>)request.getAttribute("UsernameList");
											%>
											<form method='post' action='PersonalServlet' accept-charset="UTF-8"
												id="Add_New_Account_Form">
												<div class="FormGroup mb-3">
													<label for="Email" class="form-label" style="font-weight:bold">Email
													</label>
													<input type="email" class="form-control" id="Email" name="email"
														value="" aria-describedby="emailHelp" required>
													<div id="emailHelp" class="form-text"></div>
												</div>
												<div class="FormGroup mb-3">
													<label for="Username" class="form-label"
														style="font-weight:bold">Username</label>
													<input type="text" class="form-control" id="Username"
														name="username" value="" aria-describedby="usernameHelp"
														required>
													<div id="usernameHelp" class="form-text"></div>
												</div>
												<div class="FormGroup mb-3">
													<label for="password" class="form-label"
														style="font-weight:bold">Password</label>
													<input type="password" class="form-control" id="password"
														name="password" value="" aria-describedby="passwordHelp"
														required>
													<div id="passwordHelp" class="form-text"></div>
												</div>
												<div class="FormGroup mb-3">
													<label for="Name" class="form-label"
														style="font-weight:bold">Name</label>
													<input type="text" class="form-control" id="Name" name="name"
														value="" aria-describedby="NameHelp" required>
													<div id="NameHelp" class="form-text"></div>
												</div>
												<div class="FormGroup w-100">
													<button type="submit" name="Submit" value='AddAccount'
														class="btn btn-primary w-100">Create account</button>
												</div>
											</form>
								</div>

								<div class="col col-sm-3"></div>
							</div>

						</div>
					</div>
				</body>
				<script>
					var list = "<%=list%>";
					var form = document.getElementById("Add_New_Account_Form");
					form.addEventListener("submit", function (event) {
						var username = document.getElementById("Username").value;
						if (list.includes(username)) {
							alert("Username already exists!");
							event.preventDefault();
						}
					});
				</script>

				</html>