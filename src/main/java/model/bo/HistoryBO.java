package model.bo;

import java.util.ArrayList;

import model.bean.History;
import model.bean.HistoryDetail;
import model.dao.HistoryDAO;

public class HistoryBO {
	public void AddToCharging(String username) {
		HistoryDAO dao = new HistoryDAO();
		dao.AddToCharging(username);
	}
	public ArrayList<History> getList(String username){
		HistoryDAO dao = new HistoryDAO();
		return dao.getList(username);
	}
	public ArrayList<HistoryDetail> getHistoryDetail(int ID){
		HistoryDAO dao = new HistoryDAO();
		return dao.getHistoryDetail(ID);
	}
	public boolean DeleteHistoryDetailByIDProduct (String IDProduct) {
		HistoryDAO dao = new HistoryDAO();
		return dao.DeleteHistoryDetailByIDProduct(IDProduct);
	}
	public ArrayList<History> getAllList(){
		HistoryDAO dao = new HistoryDAO();
		return dao.getAllList();
	}
	public boolean DeleteHistoryDetailByIDHistory (int IDHistory) {
		HistoryDAO dao = new HistoryDAO();
		return dao.DeleteHistoryDetailByIDHistory(IDHistory);
	}
	public boolean DeleteHistoryUsername (String Username) {
		HistoryDAO dao = new HistoryDAO();
		return dao.DeleteHistoryUsername(Username);
	}
}
