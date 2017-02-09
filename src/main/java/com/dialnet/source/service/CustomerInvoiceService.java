package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.Customer_Invoice1;

public interface CustomerInvoiceService {
public List<Customer_Invoice1> getByStatus(String status);
	
	public Customer_Invoice1 getByInvoiceId(String id);
	
	public Double getSumOfPaidAmt(String custId);
	
	public Double getTotalPaidAmt(String custId);
	
	public Customer_Invoice1 getLastPaymentDetail(String custId);

	public boolean save(Customer_Invoice1 cust);
	
	public List<Customer_Invoice1> list(String user,Integer offset, Integer maxResults);
	public Long count(String user);
	
	public int updateInvoiceDetail(String id,String paidAmt,String agentId,String paidDate,String status);
}
