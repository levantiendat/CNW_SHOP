
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page language="java" import="model.bean.Category" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Update category</title>
</head>

 <body>
 		<% Category category= (Category) request.getAttribute("category");%>
 		<%
				session = request.getSession();
				int roles = (int) session.getAttribute("roles");
				if(roles!=0 && roles!=1){
					response.sendRedirect("PersonalServlet?logout=1");
				}
		%>
      <div class="container">
      <div class="wrapper">
      <div class="row mt-3">
      <div class="col col-sm-3"></div>
      <div class="col col-sm-6 bg-light rounded-4" style="padding: 30px 60px;">
      		<h1 class="text-center mb-5 mt-1">Update Category</h1>
      		
            <form action="CategoryServlet" method="post">
                 <input type="hidden" name="update" value="1">
                 <div class="FormGroup mb-3">
                     <label class="form-label" style="font-weight:bold">ID</label>
                           <input type="text" class="form-control" name="ID" value= <%=category.getID() %> readonly>
                 </div>
                 <div class="FormGroup mb-3">
                     <label for="Name" class="form-label" style="font-weight:bold">Name</label>
                        <input type="text" class="form-control" name="Name" value="<%=category.getName()%>">
                </div>
                <div class="FormGroup w-100 d-flex justify-content-between align-items-center">
                     <input type="submit" class="btn btn-primary btn-lg" name='submit' value='ADD'
                            id="AddProduct">
               </div>

           </form>
      </div>

      <div class="col col-sm-3"></div>
      </div>

      </div>
      </div>
</body>
                        

</html>