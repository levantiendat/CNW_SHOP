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

import model.bean.Account;
import model.bo.AccountBO;
/**
 * Servlet implementation class PersonalServlet
 */
@WebServlet("/PersonalServlet")
public class PersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String method = request.getParameter("method");
		String submit = request.getParameter("Submit");
		String logout = request.getParameter("logout");
		String isGetAll = request.getParameter("all");
		AccountBO bo = new AccountBO();
		if("show".equals(method)){
			HttpSession session = request.getSession();
			String username = (String)session.getAttribute("username");
			Account acc = bo.GetAccountByUserName(username);
			if(acc != null) {
				request.setAttribute("account", acc);
				String destination = "/Personal.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
		if("SuaThongTin".equals(submit)) {
			String username = request.getParameter("Username");
			String name = request.getParameter("Name");
			String gmail = request.getParameter("Gmail");
			boolean res = bo.UpdateAccount(username, name, gmail);
			Account acc = bo.GetAccountByUserName(username);
			request.setAttribute("account", acc);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Personal.jsp?method=SuaThongTin");
			rd.forward(request, response);
		}
		if("1".equals(logout)) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
		if("1".equals(isGetAll)) {
			ArrayList<Account> list = new ArrayList<Account>();
			list = bo.getAllUser();
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("FindUserByUsername".equals(method)) {
			String username = request.getParameter("Value");
			ArrayList<Account> list = bo.SearchUserByUserName(username);
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("FindUserByName".equals(method)) {
			String name = request.getParameter("Value");
			ArrayList<Account> list = bo.SearchUserByName(name);
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("add".equals(method)) {
			String destination = "/form_addUser.jsp";
			ArrayList<String> list = bo.GetAllUsername();
			request.setAttribute("UsernameList", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("AddAccount".equals(submit)) {
			request.setCharacterEncoding("UTF-8");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			response.setContentType("text/html;charset=UTF-8");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			Account account = new Account(username, password, name, email, 0);
			Boolean res = bo.SignupAccount(account);
			ArrayList<Account> list = bo.getAllUser();
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("update".equals(method)) {
			String ID = request.getParameter("ID");
			Account acc = bo.GetAccountByUserName(ID);
			if(acc != null) {
				String destination = "/form_updateUser.jsp";
				ArrayList<String> list = bo.GetAllUsername();
				request.setAttribute("UsernameList", list);
				request.setAttribute("account", acc);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		}
		if("UpdateAccount".equals(submit)) {
			request.setCharacterEncoding("UTF-8");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			response.setContentType("text/html;charset=UTF-8");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			Boolean res = bo.UpdateAccount(username, name, email);
			ArrayList<Account> list = bo.getAllUser();
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		if("del".equals(method)) {
			String ID = request.getParameter("ID");
			Boolean res = bo.DeleteAccount(ID);
			ArrayList<Account> list = bo.getAllUser();
			request.setAttribute("list", list);
			String destination = "/admin_listUser.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
