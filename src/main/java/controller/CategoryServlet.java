package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bo.CategoryBO;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String referer = request.getHeader("Referer");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String isAdd = request.getParameter("add");
		String isUpdate = request.getParameter("update");
		String isDelete = request.getParameter("delete");
		if((isAdd != null && !isAdd.isEmpty()) && "0".equals(isAdd)) {
			
			String destination = "/form_addCategory.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else if((isAdd != null && !isAdd.isEmpty()) && "1".equals(isAdd)) {
			String ID = request.getParameter("ID");
			String Name = request.getParameter("Name");
			CategoryBO bo = new CategoryBO();
			Boolean result = bo.addCategory(ID, Name);
			if(result) {
				ArrayList<Category> category = new ArrayList<Category>();
				category = bo.getCategoryList();
				if(category !=null) {
					request.setAttribute("list", category);
					String destination = "/CategoryList.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				}
			} else {
				response.sendRedirect(referer);
			}
		} else if((isUpdate != null && !isUpdate.isEmpty()) && "0".equals(isUpdate)) {
			String ID = request.getParameter("category");
			CategoryBO bo = new CategoryBO();
			Category category = bo.getCategory(ID);
			request.setAttribute("category", category);
			String destination = "/form_updateCategory.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
			
			
		} else if((isUpdate != null && !isUpdate.isEmpty()) && "1".equals(isUpdate)) {
			String ID = request.getParameter("ID");
			String Name = request.getParameter("Name");
			CategoryBO bo = new CategoryBO();
			Boolean result = bo.updateCategory(ID, Name);
			if(result) {
				ArrayList<Category> category = new ArrayList<Category>();
				category = bo.getCategoryList();
				if(category !=null) {
					request.setAttribute("list", category);
					String destination = "/CategoryList.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				}
			} else {
				response.sendRedirect(referer);
			}
		} else if((isDelete != null && !isDelete.isEmpty()) && "1".equals(isDelete)) {
			String ID = request.getParameter("category");
			CategoryBO bo = new CategoryBO();
			Boolean result = bo.deleteCategory(ID);
			if(result) {
				ArrayList<Category> category = new ArrayList<Category>();
				category = bo.getCategoryList();
				if(category !=null) {
					request.setAttribute("list", category);
					String destination = "/CategoryList.jsp";
					RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
					rd.forward(request, response);
				}
			} else {
				response.sendRedirect(referer);
			}
		} else {
			ArrayList<Category> category = new ArrayList<Category>();
			CategoryBO bo = new CategoryBO();
			category = bo.getCategoryList();
			if(category !=null) {
				request.setAttribute("list", category);
				String destination = "/CategoryList.jsp";
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
