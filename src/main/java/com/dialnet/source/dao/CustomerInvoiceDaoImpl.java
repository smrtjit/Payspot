package com.dialnet.source.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.Customer_Invoice1;

@Repository
public class CustomerInvoiceDaoImpl implements CustomerInvoiceDao {

	@Autowired
	SessionFactory dao;

	@Override
	public boolean save(Customer_Invoice1 cust) {
		Session sf = dao.openSession();
		Transaction tx = sf.beginTransaction();
		sf.save(cust);
		tx.commit();
		sf.close();
		return true;
	}

	@Override
	public List<Customer_Invoice1> getByStatus(String status) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(Customer_Invoice1.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("billStatus", status));
		List l = cr.list();
		sf.close();
		return l;
	}

	@Override
	public Customer_Invoice1 getByInvoiceId(String id) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(Customer_Invoice1.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("Invoice_No", id));
		Customer_Invoice1 l = (Customer_Invoice1) cr.uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public Double getSumOfPaidAmt(String custId) {
		Session sf = dao.openSession();
		Double sum = 0.0;
		List<Double> sumData = sf.createCriteria(Customer_Invoice1.class)
				.setProjection(Projections.property("lastPaid")).add(Restrictions.eq("custId", custId)).list();
		for (Object d : sumData) {
			sum = sum + Double.parseDouble(d.toString());

		}
		System.out.println("getTotalPaidAmt Total: " + sum);
		sf.close();
		return sum;

	}

	@Override
	public Double getTotalPaidAmt(String custId) {
		Session sf = dao.openSession();
		Double sum = 0.0;
		List sumData = sf.createCriteria(Customer_Invoice1.class).setProjection(Projections.property("totalAmt"))
				.add(Restrictions.eq("custId", custId)).list();
		for (Object d : sumData) {
			sum = sum + Double.parseDouble(d.toString());

		}
		System.out.println("getTotalPaidAmt Total: " + sum);
		sf.close();
		return sum;
	}

	@Override
	public Customer_Invoice1 getLastPaymentDetail(String custId) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(Customer_Invoice1.class);
		c.add(Restrictions.eq("custId", custId));
		c.addOrder(Order.asc("openingBal"));
		Customer_Invoice1 l = (Customer_Invoice1) c.uniqueResult();
		sf.close();
		return l;

	}

	public List<Customer_Invoice1> list(String user, Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(Customer_Invoice1.class);
		c.add(Restrictions.eq("lcoId", user));
		c.add(Restrictions.ne("billStatus", "Approved"));
		List l = c.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(Customer_Invoice1.class);
		c.add(Restrictions.eq("lcoId", user));
		c.add(Restrictions.ne("billStatus", "Approved"));
		Long l = (Long) c.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int updateInvoiceDetail(String id, String paidAmt, String agentId, String paidDate, String status) {
		Session sf = dao.openSession();
		String qry = "update Invoice_Detail set billAmtPaid = :ramt,AgentId= :agent,dateOfPaid= :Pdate,"
				+ "billStatus= :status where Invoice_No = :id";
		Query query = sf.createSQLQuery(qry);
		query.setParameter("id", id);
		query.setParameter("ramt", paidAmt);
		query.setParameter("agent", agentId);
		query.setParameter("Pdate", paidDate);
		query.setParameter("status", status);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	@Override
	public Customer_Invoice1 getByCustomerId(String id) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(Customer_Invoice1.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("custId", id));
		Customer_Invoice1 l = (Customer_Invoice1) cr.uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public List<Customer_Invoice1> listForSingleUser(String user, Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(Customer_Invoice1.class);
		c.add(Restrictions.eq("custId", user));
		List l = c.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;
	}

	@Override
	public Long countForSingleUser(String user) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(Customer_Invoice1.class);
		c.add(Restrictions.eq("custId", user));
		Long l = (Long) c.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

}
