<%@page import="model.bean.Product" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page language="java" import="model.bean.Category" %>
            <%@page language="java" import="model.bo.CategoryBO" %>
                <%@page language="java" import="model.bean.Account" %>
                    <%@page language="java" import="java.util.ArrayList" %>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                                rel="stylesheet">
                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                            <link rel="stylesheet"
                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                            <title>Add Product</title>
                        </head>

                        <body>
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
                                            <h1 class="text-center mb-5 mt-1">Add new Product</h1>
                                            <% ArrayList<Category> cglist = (ArrayList<Category>
                                                    )request.getAttribute("CategoryList");
                                                    String message = (String)request.getAttribute("message");
                                                    if(message == null) message = "";
                                                    %>
                                                    <form action="ProductServlet" method="post" class="AddProduct" accept-charset="UTF-8">
                                                        <div class="FormGroup mb-3">
                                                            <label for="Category" class="form-label"
                                                                style="font-weight:bold">Category
                                                            </label>

                                                            <select class="form-select"
                                                                aria-label="Default select example" id="Category"
                                                                name="Category">
                                                                <% for(int i=0; i < cglist.size(); i++){ %>
                                                                    <option selected="selected"
                                                                        value="<%=cglist.get(i).getID()%>">
                                                                        <%=cglist.get(i).getName()%>
                                                                    </option>
                                                                    <%} %>
                                                            </select>

                                                        </div>
                                                        <div class="FormGroup mb-3">
                                                            <label for="Name" class="form-label"
                                                                style="font-weight:bold">Name</label>
                                                            <input type="text" class="form-control" id="Name"
                                                                name="Name">
                                                        </div>
                                                        <div class="FormGroup mb-3">
                                                            <label for="Price" class="form-label"
                                                                style="font-weight:bold">Price</label>
                                                            <input type="text" class="form-control" id="Price"
                                                                name="Price" aria-describedby="PriceHelp">
                                                            <div id="PriceHelp" class="form-text">
                                                            </div>
                                                        </div>
                                                        <div class="FormGroup mb-5">
                                                            <label for="Promotion" class="form-label"
                                                                style="font-weight:bold">Promotion</label>
                                                            <input type="text" class="form-control" id="Promotion"
                                                                name="Promotion" aria-describedby="PromotionHelp">
                                                            <div id="PromotionHelp" class="form-text">
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="FormGroup w-100 d-flex justify-content-between align-items-center">
                                                            <button type="submit" class="btn btn-primary btn-lg"
                                                                name='submit' value='AddProduct'
                                                                id="AddProduct">Submit</button>
                                                            <button type="submit" class="btn btn-primary btn-lg"
                                                                name='submit' value='CancelAddProduct'>Cancel</button>
                                                        </div>

                                                    </form>
                                        </div>

                                        <div class="col col-sm-3"></div>
                                    </div>

                                </div>
                            </div>
                        </body>
                        <script>
                            const Price = document.getElementById('Price');
                            const Promotion = document.getElementById('Promotion');
                            const AddProduct = document.querySelector('.AddProduct');
                            const PriceHelp = document.getElementById('PriceHelp');
                            const PromotionHelp = document.getElementById('PromotionHelp');
                            const AddButton = document.getElementById('AddProduct');

                            AddButton.addEventListener('click', (e) => {
                                const PriceRe = new RegExp('^[0-9]+$');
                                const ProRe = new RegExp('^-?[0-9]+$');
                                if (!PriceRe.test(Price.value) && !ProRe.test(Promotion.value)) {
                                    PriceHelp.innerHTML = 'Price must be a number';
                                    PromotionHelp.innerHTML = 'Promotion must be a number';
                                    e.preventDefault(); // Ngăn không cho form submit nếu có lỗi
                                }
                                else if (!PriceRe.test(Price.value)) {
                                    PriceHelp.innerHTML = 'Price must be a number';
                                    PromotionHelp.innerHTML = 'Promotion must be a number';
                                    e.preventDefault(); // Ngăn không cho form submit nếu có lỗi
                                }
                                else if (!ProRe.test(Promotion.value)) {
                                    PromotionHelp.innerHTML = 'Promotion must be a number';
                                    PriceHelp.innerHTML = '';
                                    e.preventDefault(); // Ngăn không cho form submit nếu có lỗi
                                }
                                if ("<%=message%>" != "") {
                                    PriceHelp.innerHTML = '';
                                    PromotionHelp.innerHTML = '';
                                    alert("<%=message%>");
                                    e.preventDefault(); // Ngăn không cho form submit nếu có thông báo
                                }
                            });

                        </script>

                        </html>