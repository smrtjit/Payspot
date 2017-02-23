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
		
		return dao.getByStatus(status);
	}

	@Override
	public Customer_Invoice1 getByInvoiceId(String id) {
	
		return dao.getByInvoiceId(id);
	}

	@Override
	public Double getSumOfPaidAmt(String custId) {
	
		return dao.getSumOfPaidAmt(custId);
	}

	@Override
	public Double getTotalPaidAmt(String custId) {
		
		return dao.getTotalPaidAmt(custId);
	}

	@Override
	public Customer_Invoice1 getLastPaymentDetail(String custId) {
	
		return dao.getLastPaymentDetail(custId);
	}

	@Override
	public boolean save(Customer_Invoice1 cust) {
		
		return dao.save(cust);
	}

	@Override
	public List<Customer_Invoice1> list(String user,Integer offset, Integer maxResults) {
	
		return dao.list(user,offset, maxResults);
	}

	@Override
	public Long count(String user) {
	
		return dao.count(user);
	}

	@Override
	public int updateInvoiceDetail(String id, String paidAmt, String agentId, String paidDate, String status) {
	
		return dao.updateInvoiceDetail(id, paidAmt, agentId, paidDate, status);
	}

	@Override
	public Customer_Invoice1 getByCustomerId(String id) {
		
		return dao.getByCustomerId(id);
	}

	@Override
	public List<Customer_Invoice1> listForSingleUser(String user, Integer offset, Integer maxResults) {
		
		return dao.listForSingleUser(user, offset, maxResults);
	}

	@Override
	public Long countForSingleUser(String user) {
		// TODO Auto-generated method stub
		return dao.countForSingleUser(user);
	}

	

}
