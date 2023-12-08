<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page language="java" import="model.bean.Category" %>
<%@page language="java" import="model.bo.CategoryBO" %>
<%@page language="java" import="model.bean.Account" %>
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
        <title>Update Product</title>
    </head>

    <body>
        <div class="container">
            <div class="wrapper">
                <div class="row mt-3">
                    <div class="col col-sm-3"></div>
                    <div class="col col-sm-6 bg-light rounded-4" style="padding: 30px 60px;">
                        <h1 class="text-center mb-5 mt-1">Update Product</h1>
                        <form action="" class="UpdateProduct">
                            <div class="FormGroup mb-3">
                                <label for="Category" class="form-label" style="font-weight:bold">Category
                                </label>
                                <%
                                	ArrayList<Category> cglist = (ArrayList<Category>)request.getAttribute("CategoryList");
                                	Product pd = (Product)request.getAttribute("product");
                                %>
                                <select class="form-select" aria-label="Default select example" id="Category">
                                	<%
                                		for(int i = 0; i < cglist.size(); i++){%>
                                			<option value="<%=cglist.get(i).getID()%>"><%=cglist.get(i).getName()%></option>
                                		<%} %>
                                </select>

                            </div>
                            <div class="FormGroup mb-3">
                                <label for="Name" class="form-label" style="font-weight:bold">Name</label>
                                <input type="text" class="form-control" id="Name" value="<%=pd.getName()%>">
                            </div>
                            <div class="FormGroup mb-3">
                                <label for="Price" class="form-label" style="font-weight:bold">Price</label>
                                <input type="password" class="form-control" id="Price" value="<%=pd.getPrice()%>" aria-describedby="PriceHelp">
                                <div id="PriceHelp" class="form-text">
                                </div>
                            </div>
                            <div class="FormGroup mb-5">
                                <label for="Promotion" class="form-label" style="font-weight:bold">Promotion</label>
                                <input type="password" class="form-control" id="Promotion" value=<%=pd.getPromotion() %>
                                    aria-describedby="PromotionHelp">
                                <div id="PromotionHelp" class="form-text"></div>
                            </div>
                            <div class="FormGroup w-100">
                                <button type="button" class="btn btn-primary w-100">Submit</button>
                            </div>
                        </form>
                    </div>

                    <div class="col col-sm-3"></div>
                </div>

            </div>
        </div>
    </body>

    </html>