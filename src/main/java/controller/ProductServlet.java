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
		String submit = request.getParameter("submit");

		if((category != null && !category.isEmpty()) && !"all".equals(category) && method == null && submit == null) {
			ProductBO bo = new ProductBO();
			ArrayList<Product> list = new ArrayList<Product>();
			list = bo.getProductByCategory(category);
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/ProductList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
				return;
			}
			
		} 
		else if("all".equals(category) || category == null && method == null && submit == null){
			ProductBO bo = new ProductBO();
			ArrayList<Product> list = new ArrayList<Product>();
			list = bo.getAllProduct();
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/ProductList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
				return;
			}
		}
		else if("update".equals(method) && category == null && submit == null) {
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
				return;
			}
		}
		else if("UpdateProduct".equals(submit)) {
			String message = "";
			try {
				ProductBO bo = new ProductBO();
				CategoryBO cgbo = new CategoryBO();
				ArrayList<Category> cglist = cgbo.getCategoryList();
				String IDCate = request.getParameter("Category");
				String Name = request.getParameter("Name");
				int Price = Integer.parseInt(request.getParameter("Price"));
				int Promotion = Integer.parseInt(request.getParameter("Promotion"));
				String ID = request.getParameter("ID");
				Product pd = new Product();
				pd.setID(ID);
				pd.setID_Category(IDCate);
				pd.setName(Name);
				pd.setPrice(Price);
				pd.setPromotion(Promotion);
				boolean res = bo.UpdateProduct(ID, IDCate, Name, Price, Promotion);
				if(res == false) {
					message = "Update Failed";
					request.setAttribute("message", message);
					request.setAttribute("product", pd);
					request.setAttribute("CategoryList", cglist);
					String destination = "/form_updateProduct.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
					return;
				}
				else {
					ProductBO Probo = new ProductBO();
					ArrayList<Product> list = new ArrayList<Product>();
					list = Probo.getAllProduct();
					if(list !=null) {
						request.setAttribute("list", list);
						String destination = "/ProductList.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
						rd.forward(request, response);
						return;
					}
				}
			}
			catch(Exception ex) {
				System.out.print("Update Product failed, error: " + ex.getLocalizedMessage()); 
			}
			
		} 
		else if("CancelUpdateProduct".equals(submit)) {
			ProductBO bo = new ProductBO();
			ArrayList<Product> list = new ArrayList<Product>();
			list = bo.getAllProduct();
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/ProductList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
