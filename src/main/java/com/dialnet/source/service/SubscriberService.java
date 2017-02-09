package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.User;

public interface SubscriberService {

	public void add(User complaints);
	public void edit(User complaints);
	public void delete(int complaints_No);
	public User get(String username);
	public List getAll();
	public User findByVCNO(String vcno);
	public User findByMobile(String vcno);
	public boolean findByLogin(String id, String pwd);
	public List<User> findByAnyone(String sdate,String edate,String stb_no,String VC_no,String mobile,String status,String pckg);
	
	public List<User> findUserForBillGeneration(String user);
	
	
	public boolean updateBillStatus(String user);
	
	//////////////////For Pagination//////////////
	
	public List<User> list(Integer offset, Integer maxResults);
	
	public Long count();
	
	public List<User> listForBill(String user,Integer offset, Integer maxResults);
	
	public Long countForBill(String user);
	
	public List userListForSearch(String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg,Integer offset, Integer maxResults);
	public Long countForSearch(String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg);
	
	
}
