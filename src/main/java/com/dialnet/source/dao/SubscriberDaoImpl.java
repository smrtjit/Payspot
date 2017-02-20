package com.dialnet.source.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.dialnet.source.model.Subscriber;

@Transactional
@Repository
public class SubscriberDaoImpl implements SubscriberDao {

	@Autowired
	private SessionFactory dao;

	@Override
	public List<Subscriber> getByLCOId(String lco, Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(Subscriber.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("LcoId", lco));
		List l = cr.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;
	}

	@Override
	public long count(String user) {
		Session sf = dao.openSession();
		Criteria c2 = sf.createCriteria(Subscriber.class);
		c2.add(Restrictions.eq("LcoId", user));
		Long l = (Long) c2.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public Subscriber getByID(String id) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(Subscriber.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("UserName", Long.parseLong(id)));
		Subscriber subscriber = (Subscriber) cr.uniqueResult();
		sf.close();
		return subscriber;
	}

	@Override
	public List<Subscriber> findByAnyone(String user, String sdate, String edate, String stb_no, String VC_no,
			String mobile, String status, String pckg, Integer offset, Integer maxResults) {
		System.out.println("sdate: " + sdate + ",edate: " + edate + ",VC_no: " + VC_no + ",mobile: " + mobile
				+ ",pckg: " + pckg + ",Status: " + status);
		Session sf = dao.openSession();
		Criteria criteria = sf.createCriteria(Subscriber.class);
		criteria.add(Restrictions.eq("LcoId", user));
		if (sdate == null || sdate.equalsIgnoreCase("")) {
			System.out.println("sdate is not available");
		} else {
			criteria.add(Restrictions.gt("trndate", sdate + " 00:00:00"));
		}

		if (edate == null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else {
			criteria.add(Restrictions.lt("trndate", edate + " 59:59:59"));
		}

		if (VC_no == null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else {
			criteria.add(Restrictions.eq("FirstName", VC_no));
		}

		if (mobile == null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
			criteria.add(Restrictions.eq("Mobile", mobile));
		if (pckg == null || pckg.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("BasePCKG", pckg));

		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("SubStatus", status));

		if (stb_no == null || stb_no.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("STBNo", stb_no));
		List l = criteria.list();
		sf.close();
		return l;
	}

	@Override
	public Long countForSearch(String user, String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg) {
		Session sf = dao.openSession();

		Criteria criteria = sf.createCriteria(Subscriber.class);
		criteria.add(Restrictions.eq("LcoId", user));
		if (sdate == null || sdate.equalsIgnoreCase("")) {
			System.out.println("sdate is not available");
		} else {
			criteria.add(Restrictions.gt("trndate", sdate + " 00:00:00"));
		}

		if (edate == null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else {
			criteria.add(Restrictions.lt("trndate", edate + " 59:59:59"));
		}

		if (VC_no == null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else {
			criteria.add(Restrictions.eq("FirstName", VC_no));
		}

		if (mobile == null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
			criteria.add(Restrictions.eq("Mobile", mobile));
		if (pckg == null || pckg.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("BasePCKG", pckg));

		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("SubStatus", status));

		if (stb_no == null || stb_no.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
			criteria.add(Restrictions.eq("STBNo", stb_no));
		Long l = (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int addSubscriber(Subscriber sub) {
		Session sf = dao.openSession();
		Transaction tx = sf.beginTransaction();
		sf.save(sub);
		tx.commit();
		sf.close();
		return 1;
	}

	@Override
	public int connectionUpdate(Subscriber sub) {
		Session sf = dao.openSession();
		Transaction tx= sf.beginTransaction();
		sf.saveOrUpdate(sub);
		tx.commit();
		sf.close();
		return 1;
	}

	@Override
	public int updateConnection(String username, String firstname, String middlename, String lastname, String mobile,
			String email, String address, String landmark, String state, String city, String pincode, String stbno,
			String accountblance) {
		
		Session sf = dao.openSession();
		String qry="update Subscriber set firstName = :firstname,middleName= :middlename,lastName= :lastname,"
				+ "mobile= :mobile,emailId= :email,address = :address,landMark = :landmark,"
				+ "state = :state,city = :city,pincode = :pincode,sTBNo = :stbno,accountBalance = :accountblance where userName = :id";
		Query query = sf.createSQLQuery(qry);
		query.setParameter("userName",username);
		query.setParameter("firstName",firstname);
		query.setParameter("middleName", middlename);
		query.setParameter("lastName", lastname);
		query.setParameter("mobile", mobile);
		query.setParameter("emailId", email);
		query.setParameter("address", address);
		query.setParameter("landMark", landmark);
		query.setParameter("state", state);
		query.setParameter("city", city);
		query.setParameter("pincode", pincode);
		query.setParameter("sTBNo", stbno);
		query.setParameter("accountBalance", accountblance);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	
}
