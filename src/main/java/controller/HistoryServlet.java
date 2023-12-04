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

import model.bean.History;
import model.bean.HistoryDetail;
import model.bo.HistoryBO;

@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String referer = request.getHeader("Referer");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String detail = (String) request.getParameter("detail");
		System.out.println(detail);
		if((detail != null && !detail.isEmpty()) && "0".equals(detail)) {
			ArrayList<History> list = new ArrayList<History>();
			HistoryBO bo = new HistoryBO();
			list = bo.getList(username);
			if(list!=null) {
				request.setAttribute("list", list);
				String destination = "/HistoryList.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				response.sendRedirect(referer);
			}
			
		} else if((detail != null && !detail.isEmpty()) && "1".equals(detail)) {
			ArrayList<HistoryDetail> list = new ArrayList<HistoryDetail>();
			int ID =Integer.parseInt(request.getParameter("ID"));
			HistoryBO bo = new HistoryBO();
			list = bo.getHistoryDetail(ID);
			if(list!=null) {
				request.setAttribute("list", list);
				String destination = "/HistoryDetail.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				response.sendRedirect(referer);
			}
		} else {
			HistoryBO bo = new HistoryBO();
			bo.AddToCharging(username);
			response.sendRedirect(referer);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
