package com.dialnet.source.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.model.LCO_Setting;
import com.dialnet.source.model.User;
import com.dialnet.source.service.CustSettingService;


@Transactional
@Repository
public class SubscriberDaoImpl implements SubsriberDao {

	@Autowired
	private SessionFactory dao;
	
	

	public void add(User complaints) {
		Session sf = dao.openSession();
		sf.save(complaints);
		sf.close();
	}

	public void edit(User complaints) {
		// TODO Auto-generated method stub

	}

	public void delete(int complaints_No) {
		// TODO Auto-generated method stub

	}

	public User get(String complaints_No) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(User.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("username", complaints_No));
		User product = (User)cr.uniqueResult();
		sf.close();
		return product;
	}

	public List getAll() {
		Session sf = dao.openSession();
		List l=sf.createCriteria(User.class).list();
		sf.close();
		return l;
	}

	public User findByVCNO(String vcno) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(User.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("customer_vc_no", vcno));
		User product = (User)cr.uniqueResult();
		//System.out.println("user: " + product);
		sf.close();
		return product;
	}

	
	public User findByMobile(String vcno) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(User.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("customer_mobile", vcno));
		User product = (User)cr.uniqueResult();
		//System.out.println("user: " + product);
		sf.close();
		return product;
	}
	
	
	@Override
	public List<User> findByAnyone(String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg) {
		System.out.println("sdate: "+sdate+",edate: "+edate+",VC_no: "+VC_no+",mobile: "+mobile+",pckg: "+pckg+",Status: "+status);
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		if(sdate==null || sdate.equalsIgnoreCase("")){
			System.out.println("sdate is not available");
		}
		else{
			criteria.add(Restrictions.gt("timestamp",sdate+" 00:00:00"));
		}
		
		if(edate==null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else{
			criteria.add(Restrictions.lt("timestamp",edate+" 59:59:59"));
		}
		
		if(VC_no==null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else{
			criteria.add(Restrictions.eq("customer_vc_no",VC_no));
		}
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("customer_mobile",mobile));
		if(pckg==null || pckg.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("package_name",pckg));
		
		if(status==null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("connection_status",status));
		
		if(stb_no==null || stb_no.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("customer_stb_no",stb_no));
		List l=criteria.list();
		sf.close();
		return l;
	}

	@Override
	public List<User> findUserForBillGeneration(String user) {
		
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		criteria.add(Restrictions.eq("lco_id",user));
		criteria.add(Restrictions.eq("bill_status","NO"));
		//Criterion rest1= Restrictions.and(Restrictions.eq("con_expiry_date",getDate()));
		//Criterion rest2= Restrictions.and(Restrictions.lt("con_expiry_date",getDate()));
		//criteria.add(Restrictions.or(rest1, rest2));
		List l=criteria.list();
		sf.close();
		return l;
	}
	
	
	
	@Override
	public boolean updateBillStatus(String user) {
		System.out.println("user for update Bill: "+user);
		Session sf=dao.openSession();
		Query q = sf.createQuery("update User set bill_status=:recievedDate where username=:Id");
		q.setString("recievedDate", "YES");
		q.setString("Id", user);
		q.executeUpdate();
		sf.close();
		return true;
	}
/////////////////////////////////////////////////////////For Pagination/////////////////////////////////////////////////////
	
	public List<User> list(Integer offset, Integer maxResults){
		Session sf=dao.openSession();
		List l=sf.createCriteria(User.class)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10)
				.list();
		sf.close();
		return l;
	}
	
	
	public Long count(){
		Session sf=dao.openSession();
		Long l= (Long)sf.createCriteria(User.class)
			.setProjection(Projections.rowCount())
			.uniqueResult();
		 sf.close();
		return l;
	}
	
	
	public List<User> listForBill(String user,Integer offset, Integer maxResults){
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		criteria.add(Restrictions.eq("bill_status","NO"));
		criteria.add(Restrictions.eq("lco_id",user));
		//Criterion rest1= Restrictions.and(Restrictions.eq("con_expiry_date",getDate()));
		//Criterion rest2= Restrictions.and(Restrictions.lt("con_expiry_date",getDate()));
		//criteria.add(Restrictions.or(rest1, rest2));
		List l= criteria.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10).list();
		sf.close();
		
		return l;
		
	}
	
	
	public Long countForBill(String user){
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		criteria.add(Restrictions.eq("bill_status","NO"));
		criteria.add(Restrictions.eq("lco_id",user));
		//Criterion rest1= Restrictions.and(Restrictions.eq("con_expiry_date",getDate()));
		//Criterion rest2= Restrictions.and(Restrictions.lt("con_expiry_date",getDate()));
		//criteria.add(Restrictions.or(rest1, rest2));
		Long l=(Long)criteria
				.setProjection(Projections.rowCount())
				.uniqueResult();
		sf.close();
		return l;
	}
	
	
	
	public List userListForSearch(String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg,Integer offset, Integer maxResults) {
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		if(sdate==null || sdate.equalsIgnoreCase("")){
			System.out.println("sdate is not available");
		}
		else{
			criteria.add(Restrictions.gt("timestamp",sdate+" 00:00:00"));
		}
		
		if(edate==null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else{
			criteria.add(Restrictions.lt("timestamp",edate+" 59:59:59"));
		}
		
		if(VC_no==null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else{
			criteria.add(Restrictions.eq("customer_vc_no",VC_no));
		}
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("customer_mobile",mobile));
		if(pckg==null || pckg.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("package_name",pckg));
		
		if(status==null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("connection_status",status));
		
		if(stb_no==null || stb_no.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("customer_stb_no",stb_no));
		List l= criteria
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10)
				.list();
		sf.close();
		return l;
	}
	
	
	public Long countForSearch(String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg){
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(User.class); 
		if(sdate==null || sdate.equalsIgnoreCase("")){
			System.out.println("sdate is not available");
		}
		else{
			criteria.add(Restrictions.gt("timestamp",sdate+" 00:00:00"));
		}
		
		if(edate==null || edate.equalsIgnoreCase(""))
			System.out.println("edate is not available");
		else{
			criteria.add(Restrictions.lt("timestamp",edate+" 59:59:59"));
		}
		
		if(VC_no==null || VC_no.equalsIgnoreCase(""))
			System.out.println("VC_no is not available");
		else{
			criteria.add(Restrictions.eq("customer_vc_no",VC_no));
		}
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("customer_mobile",mobile));
		if(pckg==null || pckg.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("package_name",pckg));
		
		if(status==null || status.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("connection_status",status));
		
		if(stb_no==null || stb_no.equalsIgnoreCase(""))
			System.out.println("pckg is not available");
		else
		criteria.add(Restrictions.eq("customer_stb_no",stb_no));
		Long l= (Long)criteria
				.setProjection(Projections.rowCount())
				.uniqueResult();
		sf.close();
		return l;
	}
	

	
/////////////////////////////////////////////////////////////For Date////////////////////////////////////////////////////
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

	

}
