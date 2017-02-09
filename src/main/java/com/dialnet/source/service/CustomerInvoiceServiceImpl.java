package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.CustomerInvoiceDao;
import com.dialnet.source.model.Customer_Invoice1;

@Service("inservice")
public class CustomerInvoiceServiceImpl implements CustomerInvoiceService {
	
	@Autowired
	CustomerInvoiceDao dao;

	@Override
	public List<Customer_Invoice1> getByStatus(String status) {
		// TODO Auto-generated method stub
		return dao.getByStatus(status);
	}

	@Override
	public Customer_Invoice1 getByInvoiceId(String id) {
		// TODO Auto-generated method stub
		return dao.getByInvoiceId(id);
	}

	@Override
	public Double getSumOfPaidAmt(String custId) {
		// TODO Auto-generated method stub
		return dao.getSumOfPaidAmt(custId);
	}

	@Override
	public Double getTotalPaidAmt(String custId) {
		// TODO Auto-generated method stub
		return dao.getTotalPaidAmt(custId);
	}

	@Override
	public Customer_Invoice1 getLastPaymentDetail(String custId) {
		// TODO Auto-generated method stub
		return dao.getLastPaymentDetail(custId);
	}

	@Override
	public boolean save(Customer_Invoice1 cust) {
		// TODO Auto-generated method stub
		return dao.save(cust);
	}

	@Override
	public List<Customer_Invoice1> list(String user,Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.list(user,offset, maxResults);
	}

	@Override
	public Long count(String user) {
		// TODO Auto-generated method stub
		return dao.count(user);
	}

	@Override
	public int updateInvoiceDetail(String id, String paidAmt, String agentId, String paidDate, String status) {
		// TODO Auto-generated method stub
		return dao.updateInvoiceDetail(id, paidAmt, agentId, paidDate, status);
	}

	

}
