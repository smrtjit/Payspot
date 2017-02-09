package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.dao.Cust_InvoiceDao;
import com.dialnet.source.model.Cust_Invoice;

@Service("cust_save")
public class Cust_InvoiceServiceImpl implements Cust_InvoiceService {

	@Autowired
	private Cust_InvoiceDao cust_invoice_dao;
	
	@Transactional
	public List<Cust_Invoice> getAll() {
		// TODO Auto-generated method stub
		return cust_invoice_dao.getAll();
	}

	@Transactional
	public List<Cust_Invoice> getByAnyOne(String Invoice_no, String billing_date, String last_date) {
		// TODO Auto-generated method stub
		return cust_invoice_dao.getByAnyOne(Invoice_no, billing_date, last_date);
	}

	@Override
	public boolean save(Cust_Invoice cust) {
		
		return cust_invoice_dao.save(cust);
	}

	@Override
	public List<Cust_Invoice> getBillList() {
		
		return cust_invoice_dao.getBillList();
	}

	@Override
	public Cust_Invoice getByInvoice(String id) {
		// TODO Auto-generated method stub
		return cust_invoice_dao.getByInvoice(id);
	}

	@Override
	public List<Cust_Invoice> list(Integer offset, Integer maxResults) {
		
		return cust_invoice_dao.list(offset, maxResults);
	}

	@Override
	public Long count() {
		
		return cust_invoice_dao.count();
	}

}
