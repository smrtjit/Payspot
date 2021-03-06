package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.AllComplaints;

public interface AllComplaintService {

	public void add(AllComplaints complaints);
	public int edit(String id,String CRemark,String status);
	public void delete(int complaints_No);
	public List<AllComplaints> list(String user,Integer offset, Integer maxResults);
	public Long count(String user);
	public Long countForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status);
	public List<AllComplaints> listForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status,Integer offset, Integer maxResults);
	public AllComplaints getComplaint(String id);
	public  List<AllComplaints> getComplaintByNo(String custid,Integer offset, Integer maxResults);

	public Long countForAll(String custid);
}
