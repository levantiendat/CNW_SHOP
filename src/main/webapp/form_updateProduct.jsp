<%@page import="model.bean.Product" %>
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
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                                rel="stylesheet">
                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
                                            <% ArrayList<Category> cglist = (ArrayList<Category>
                                                    )request.getAttribute("CategoryList");
                                                    Product pd = (Product)request.getAttribute("product");
                                                    String message = (String)request.getAttribute("message");
                                                    if(message == null) message = "";
                                                    %>
                                                    <form action="ProductServlet" method="post" class="UpdateProduct">
                                                        <div class="FormGroup mb-3">
                                                            <label for="Category" class="form-label"
                                                                style="font-weight:bold">Category
                                                            </label>

                                                            <select class="form-select"
                                                                aria-label="Default select example" id="Category"
                                                                name="Category">
                                                                <% for(int i=0; i < cglist.size(); i++){
                                                                    if(!cglist.get(i).getID().equals(pd.getID_Category())){
                                                                    %>
                                                                    <option value="<%=cglist.get(i).getID()%>">
                                                                        <%=cglist.get(i).getName()%>
                                                                    </option>
                                                                    <%} else{ %>
                                                                        <option selected="selected"
                                                                            value="<%=cglist.get(i).getID()%>">
                                                                            <%=cglist.get(i).getName()%>
                                                                        </option>
                                                                        <%}} %>
                                                            </select>

                                                        </div>
                                                        <div class="FormGroup mb-3">
                                                            <label for="Name" class="form-label"
                                                                style="font-weight:bold">Name</label>
                                                            <input type="text" class="form-control" id="Name"
                                                                name="Name" value="<%=pd.getName()%>">
                                                        </div>
                                                        <div class="FormGroup mb-3">
                                                            <label for="Price" class="form-label"
                                                                style="font-weight:bold">Price</label>
                                                            <input type="text" class="form-control" id="Price"
                                                                name="Price" value="<%=pd.getPrice()%>"
                                                                aria-describedby="PriceHelp">
                                                            <div id="PriceHelp" class="form-text">
                                                            </div>
                                                        </div>
                                                        <div class="FormGroup mb-5">
                                                            <label for="Promotion" class="form-label"
                                                                style="font-weight:bold">Promotion</label>
                                                            <input type="text" class="form-control" id="Promotion"
                                                                name="Promotion" value=<%=pd.getPromotion() %>
                                                            aria-describedby="PromotionHelp">
                                                            <div id="PromotionHelp" class="form-text">
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="FormGroup w-100 d-flex justify-content-between align-items-center">
                                                            <button type="submit" class="btn btn-primary btn-lg"
                                                                name='submit' value='UpdateProduct'
                                                                id="UpdateProduct">Submit</button>
                                                            <button type="submit" class="btn btn-primary btn-lg"
                                                                name='submit'
                                                                value='CancelUpdateProduct'>Cancel</button>
                                                        </div>
                                                        <input type="hidden" name="ID" value="<%=pd.getID()%>">
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
                            const UpdateProduct = document.querySelector('.UpdateProduct');
                            const PriceHelp = document.getElementById('PriceHelp');
                            const PromotionHelp = document.getElementById('PromotionHelp');
                            // Chọn nút submit có tên là 'update'
                            const UpdateButton = document.getElementById('UpdateProduct');

                            UpdateButton.addEventListener('click', (e) => {
                                const re = new RegExp('^[0-9]+$');
                                if(!re.test(Price.value) && !re.test(Promotion.value)){
                                	PriceHelp.innerHTML = 'Price must be a number';
                                	PromotionHelp.innerHTML = 'Promotion must be a number';
                                	e.preventDefault(); // Ngăn không cho form submit nếu có lỗi
                                }
                                else if(!re.test(Price.value)){
                                	PriceHelp.innerHTML = 'Price must be a number';
                                	PromotionHelp.innerHTML = 'Promotion must be a number';
                                	e.preventDefault(); // Ngăn không cho form submit nếu có lỗi
                                }
                                else if (!re.test(Promotion.value)) {
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