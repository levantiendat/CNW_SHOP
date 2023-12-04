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
}
