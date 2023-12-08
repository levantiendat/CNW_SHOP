package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Product;
import model.bo.ProductBO;
import model.bean.Category;
import model.bo.CategoryBO;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category = request.getParameter("category");
		String method = request.getParameter("method");
		
		if((category != null && !category.isEmpty()) && !"all".equals(category)) {
			ProductBO bo = new ProductBO();
			ArrayList<Product> list = new ArrayList<Product>();
			list = bo.getProductByCategory(category);
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/ProductList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
			
		} else {
			ProductBO bo = new ProductBO();
			ArrayList<Product> list = new ArrayList<Product>();
			list = bo.getAllProduct();
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/ProductList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
		if("update".equals(method)) {
			String IDProduct = request.getParameter("ID");
			ProductBO bo = new ProductBO();
			CategoryBO cgbo = new CategoryBO();
			ArrayList<Category> cglist = cgbo.getCategoryList();
			Product pd = bo.getProduct(IDProduct);
			if(pd != null && cglist != null) {
				request.setAttribute("product", pd);
				request.setAttribute("CategoryList", cglist);
				String destination = "/form_updateProduct.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
