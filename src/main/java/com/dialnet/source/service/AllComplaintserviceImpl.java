package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dialnet.source.dao.AllComplaintdao;
import com.dialnet.source.model.AllComplaints;

@Service("save")
public class AllComplaintserviceImpl implements AllComplaintService {
	
	@Autowired
	private AllComplaintdao allcomplaintdao;

	@Transactional
	public void add(AllComplaints complaints) {
		allcomplaintdao.add(complaints);
	}

	@Transactional
	public int edit(String id,String CRemark,String status) {
		return allcomplaintdao.edit(id,CRemark,status);

	}

	@Transactional
	public void delete(int complaints_No) {
		allcomplaintdao.delete(complaints_No);

	}

	@Override
	public List<AllComplaints> list(String user,Integer offset, Integer maxResults) {
		return allcomplaintdao.list(user,offset, maxResults);
	}

	@Override
	public Long count(String user) {
		return allcomplaintdao.count(user);
	}

	@Override
	public Long countForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status) {
		return allcomplaintdao.countForSearch(user,sdate, edate, VC_no, mobile, status);
	}

	@Override
	public List<AllComplaints> listForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status,
			Integer offset, Integer maxResults) {
		return allcomplaintdao.listForSearch(user,sdate, edate, VC_no, mobile, status, offset, maxResults);
	}

	@Override
	public AllComplaints getComplaint(String id) {
		return allcomplaintdao.getComplaint(id);
	}

	
	@Override
	public List<AllComplaints> getComplaintByNo(String custid, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return allcomplaintdao.getComplaintByNo(custid, offset, maxResults);
	}

	@Override
	public Long countForAll(String custid) {
		// TODO Auto-generated method stub
		return allcomplaintdao.countForAll(custid);
	}

}
