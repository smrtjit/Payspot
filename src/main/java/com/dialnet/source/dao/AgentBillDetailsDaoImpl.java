package com.dialnet.source.dao;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.model.AgentBillDetails;

@Transactional
@Repository
public class AgentBillDetailsDaoImpl implements AgentBillDetailsDao {
	
	@Autowired
	SessionFactory session;

	@Override
	public int saveDetail(AgentBillDetails obj) {
		//System.out.println("hello call dta: "+obj.getCustId());
		Session sf = session.openSession();
		Transaction tx= sf.beginTransaction();
		sf.save(obj);
		tx.commit();
		sf.close();
		//System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public int updateAgentBill(String id, String RAmt, String RId, String remark, String status, String ApprovedBy,
			String ApprovedDate) {
		Session sf = session.openSession();
		String qry="update Agent_Bill_Details set receivedAmt = :ramt,referenceId= :rid,Remark= :rem,"
				+ "instatus= :status,referenceId= :Rid,approvedBy = :lcoid,approvalDate = :ApprovedDate where invoice_id = :id";
		Query query = sf.createSQLQuery(qry);
		query.setParameter("id",id);
		query.setParameter("ramt",RAmt);
		query.setParameter("rid", RId);
		query.setParameter("rem", remark);
		query.setParameter("Rid", RId);
		query.setParameter("status", status);
		query.setParameter("lcoid", ApprovedBy);
		query.setParameter("ApprovedDate", ApprovedDate);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

}
