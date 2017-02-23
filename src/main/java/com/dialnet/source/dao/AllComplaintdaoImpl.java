package com.dialnet.source.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.AllComplaints;

@Repository("save1")
public class AllComplaintdaoImpl implements AllComplaintdao {

	@Autowired
	private SessionFactory session;

	public void add(AllComplaints complaints) {
		Session sf = session.openSession();
		Transaction tx = sf.beginTransaction();
		sf.save(complaints);
		tx.commit();
		sf.close();
	}

	public int edit(String id, String CRemark, String status) {
		Session sf = session.openSession();
		Query query = sf.createSQLQuery(
				"update all_complaints set complaint_status = :st,closing_remark= :rem,closing_date= :dt where complaint_no = :id");
		query.setParameter("id", id);
		query.setParameter("rem", CRemark);
		query.setParameter("dt", getDate());
		query.setParameter("st", status);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	public void delete(int complaints_No) {
		session.getCurrentSession().delete(complaints_No);

	}

	//////////////////////////////////////////////////// For
	//////////////////////////////////////////////////// Pagination//////////////////////////////////////////////////////

	public List<AllComplaints> list(String user, Integer offset, Integer maxResults) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(AllComplaints.class);
		cr.add(Restrictions.eq("lco_id", user));
		List l = cr.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(AllComplaints.class);
		cr.add(Restrictions.eq("lco_id", user));
		Long l = (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	public List<AllComplaints> listForSearch(String user, String sdate, String edate, String VC_no, String mobile,
			String status, Integer offset, Integer maxResults) {
		Session sf = session.openSession();
		Criteria criteria = sf.createCriteria(AllComplaints.class);
		criteria.add(Restrictions.eq("lco_id", user));
		if (sdate == null || sdate.equalsIgnoreCase("")) {
			System.out.println("sdate is not available");
		} else {
			criteria.add(Restrictions.gt("open_date", sdate + " 00:00:00"));
		}

		if (edate == null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else {
			criteria.add(Restrictions.lt("open_date", edate + " 59:59:59"));
		}

		if (VC_no == null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else {
			criteria.add(Restrictions.eq("customer_caf", VC_no));
		}

		if (mobile == null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
			criteria.add(Restrictions.eq("customer_mobile", mobile));
		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("complaint_status", status));

		List l = criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	public Long countForSearch(String user, String sdate, String edate, String VC_no, String mobile, String status) {
		Session sf = session.openSession();
		Criteria criteria = sf.createCriteria(AllComplaints.class);
		criteria.add(Restrictions.eq("lco_id", user));
		if (sdate == null || sdate.equalsIgnoreCase("")) {
			System.out.println("sdate is not available");
		} else {
			criteria.add(Restrictions.gt("open_date", sdate + " 00:00:00"));
		}

		if (edate == null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else {
			criteria.add(Restrictions.lt("open_date", edate + " 59:59:59"));
		}

		if (VC_no == null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else {
			criteria.add(Restrictions.eq("customer_caf", VC_no));
		}

		if (mobile == null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
			criteria.add(Restrictions.eq("customer_mobile", mobile));
		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("complaint_status", status));
		Long l = (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	public String getDate() {
		String trnstamp = null;
		try {
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = new Date();
			String strDate = sdfDate.format(now);
			// System.out.println(strDate.toString());
			trnstamp = strDate.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return trnstamp;
	}

	@Override
	public AllComplaints getComplaint(String id) {
		Session sf = session.openSession();
		Criteria c2 = sf.createCriteria(AllComplaints.class);
		c2.add(Restrictions.eq("complaint_no", Long.parseLong(id)));
		// AllComplaints product = (AllComplaints) sf.get(AllComplaints.class,
		// Long.parseLong(complaints_No));
		// System.out.println("customer_vcno: " + product);
		AllComplaints tmp = (AllComplaints) c2.uniqueResult();
		System.out.println("complaint_no: " + tmp);
		sf.close();
		return tmp;
	}

	@Override
	public List<AllComplaints> getComplaintByNo(String custid, Integer offset, Integer maxResults) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(AllComplaints.class);
		cr.add(Restrictions.eq("creater_Id", custid));
		List l = cr.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;

	}

	public Long countForAll(String custid) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(AllComplaints.class);
		cr.add(Restrictions.eq("creater_Id", custid));
		Long l = (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

}
