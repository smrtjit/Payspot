package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.model.AllCollections;


@Transactional
@Repository
public class AllCollectionDaoImpl implements AllCollectionDao {
	
	@Autowired
	SessionFactory dao;

	@Override
	public List<AllCollections> getAll(String user) {
		Session sf=dao.openSession();
		Criteria cr=sf.createCriteria(AllCollections.class);
		cr.add(Restrictions.eq("Lco_Id", user));
		List l= cr.list();
		sf.close();
		return l;
		
	}

	@Override
	public List<AllCollections> getByAnyOne(String user,String sdate, String edate, String VC_no, String mobile, String status,String agent,Integer offset, Integer maxResults) {
		System.out.println("sdate: "+sdate+",edate: "+edate+",VC_no: "+VC_no+",mobile: "+mobile+",pckg: "+status);
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(AllCollections.class); 
		criteria.add(Restrictions.eq("Lco_Id", user));
		if(sdate==null || sdate.equalsIgnoreCase("")){
			System.out.println("sdate is not available");
		}
		else{
			criteria.add(Restrictions.gt("trndate",sdate+" 00:00:00"));
		}
		
		if(edate==null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else{
			criteria.add(Restrictions.lt("trndate",edate+" 59:59:59"));
		}
		
		if(VC_no==null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else{
			criteria.add(Restrictions.eq("VC_No",VC_no.trim()));
		}
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("cust_mobile",mobile));
		
		if(status==null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("Payment_Status",status));
		
		if(agent==null || agent.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("Collecting_Agent",agent));
		//System.out.println("List size in searching: "+criteria.list().size());
		List l= criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
		
	}
	
	
	
	public Long countForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status,String agent) {
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(AllCollections.class); 
		criteria.add(Restrictions.eq("Lco_Id", user));
		if(sdate==null || sdate.equalsIgnoreCase("")){
			System.out.println("sdate is not available");
		}
		else{
			criteria.add(Restrictions.gt("trndate",sdate+" 00:00:00"));
		}
		
		if(edate==null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else{
			criteria.add(Restrictions.lt("trndate",edate+" 59:59:59"));
		}
		
		if(VC_no==null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else{
			criteria.add(Restrictions.eq("VC_No",VC_no.trim()));
		}
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("cust_mobile",mobile));
		
		if(status==null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("Payment_Status",status));
		
		if(agent==null || agent.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("Collecting_Agent",agent));
		Long l= (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}
	
	////////////////////////////////////////////////////For Pagination//////////////////////////////////////////////////////
	
	public List<AllCollections> list(String user,Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria cr=sf.createCriteria(AllCollections.class);
		cr.add(Restrictions.eq("Lco_Id", user));
		List l= cr.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		Session sf = dao.openSession();
		Criteria cr=sf.createCriteria(AllCollections.class);
		cr.add(Restrictions.eq("Lco_Id", user));
		Long l= (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int saveDetail(AllCollections obj) {
		//System.out.println("hello call dta: "+obj.getCustId());
				Session sf = dao.openSession();
				Transaction tx= sf.beginTransaction();
				sf.save(obj);
				tx.commit();
				sf.close();
				//System.out.println("Save AgentBillDetails done");
				return 1;
			}

	@Override
	public Object getBulkInfo(String invoice) {
//		Session sf = dao.openSession();
//		String qry="FROM `AllCollections` a JOIN `Customer_Invoice1` b ON b.`Invoice_No`=a.`Invoice` WHERE a.invoice=";
//		Object data = sf.createQuery(
//				"from Continent cont join cont.countries ctry " +
//				"where cont.name = 'Africa'")
//				.uniqueResult();
//		sf.close();
		return null;
	}

	@Override
	public AllCollections getByInvoice(String invoice) {
		Session sf = dao.openSession();
		Criteria cr=sf.createCriteria(AllCollections.class);
		cr.add(Restrictions.eq("Invoice", invoice));
		AllCollections l= (AllCollections) cr.uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int updateCollection(String invoice, String rAmt, String lcoId, String RId, String status, String remark,
			String appDate) {
		Session sf = dao.openSession();
		String qry="update All_Collection set Paid_Amount = :ramt,Payment_Status= :status,Approval_ID= :approvalId,"
				+ "Approval_Date= :apprvalDate,RefernceId= :Rid,Remark = :remark where Invoice = :id";
		Query query = sf.createSQLQuery(qry);
		query.setParameter("id",invoice);
		query.setParameter("ramt",rAmt);
		query.setParameter("approvalId", lcoId);
		query.setParameter("status", status);
		query.setParameter("Rid", RId);
		query.setParameter("remark", remark);
		query.setParameter("apprvalDate", appDate);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}



}
