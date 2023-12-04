package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Cart;
import model.bo.CartBO;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("username");
		String referer = request.getHeader("Referer");
		String isAdd = request.getParameter("add");
		String isShow = request.getParameter("show");
		String isUpdate = request.getParameter("update");
		String isDelete = request.getParameter("delete");
		
		if((isAdd != null && !isAdd.isEmpty()) && "1".equals(isAdd)) {
			String ID = request.getParameter("ID");
			CartBO bo = new CartBO();
			
			Boolean result = bo.addToCart(user, ID);
			response.sendRedirect(referer);
		}
		if((isShow != null && !isShow.isEmpty()) && "1".equals(isShow)) {
			
			CartBO bo = new CartBO();
			ArrayList<Cart> list = new ArrayList<>();
			list = bo.showCart(user);
			if(list !=null) {
				request.setAttribute("list", list);
				String destination = "/CartList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				
				response.sendRedirect(referer);
			}
			
			
		}
		if((isUpdate != null && !isUpdate.isEmpty())) {
			if("0".equals(isUpdate)) {
				String ProductID = request.getParameter("ProductID");
				Cart cart = new Cart();
				CartBO bo = new CartBO();
				cart = bo.getCart(user, ProductID);
				request.setAttribute("cart", cart);
				String destination = "/form_updateCart.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				//Lấy thông tin từ form xử lý
				try {
					String ProductID = request.getParameter("ID_Product");
					int number = Integer.parseInt( request.getParameter("Product_num"));
					CartBO bo = new CartBO();
					bo.UpdateCart(user, ProductID, number);
					String destination = "/CartServlet?show=1";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch(Exception e) {
					response.sendRedirect(referer);
					e.printStackTrace();
				}	
				
			}
		}
		if((isDelete != null && !isDelete.isEmpty()) && "1".equals(isDelete)) {
			
			String ProductID = request.getParameter("ProductID");
			
			CartBO bo = new CartBO();
			bo.DeleteCart(user, ProductID);
			response.sendRedirect(referer);

		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
