package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Transaction;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.dialnet.source.model.LMUser;
import com.dialnet.source.model.PackageInfo;




@Transactional
@Repository("lmdao")
public class LMUserDaoImpl implements LMUserDao {

	@Autowired
	private SessionFactory dao;

	@Override
	public void add(LMUser obj) {
		Session sf = dao.openSession();
		Transaction tx= sf.beginTransaction();
		sf.save(obj);
		tx.commit();
		sf.close();
	}

	@Override
	public int edit(LMUser obj) {
		Session sf = dao.openSession();
		Transaction tx= sf.beginTransaction();
		sf.saveOrUpdate(obj);
		tx.commit();
		sf.close();
		return 1;
	}

	@Override
	public void delete(String username) {
		// TODO Auto-generated method stub

	}

	@Override
	public LMUser get(String username) {
		Session sf = dao.openSession();
		Criteria c2 = sf.createCriteria(LMUser.class);
		c2.add(Restrictions.eq("username", Long.parseLong(username)));
		//System.out.println("LMUser Id: " + username);
		LMUser product = (LMUser) c2.uniqueResult();
		// LCOUser product = (LCOUser) sf.get(LMUser.class,
		// Long.parseLong(username));
		//System.out.println("LMUser: " + product);
		sf.close();
		return product;
	}

	@Override
	public List<LMUser> getAll() {
		System.out.println("Get all old user in daoImpl");
		Session sf = dao.openSession();
		List l= sf.createCriteria(LMUser.class).list();
		sf.close();
		return l;
	}

	///////////////////////////////////////////////////////// For
	///////////////////////////////////////////////////////// Pagination/////////////////////////////////////////////////////

	public List<LMUser> list(String user , Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria criteria=sf.createCriteria(LMUser.class);
		criteria.addOrder(Order.desc("trnadate"));
		criteria.add(Restrictions.eq("lco_id",user));
		List l= criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		
		Session sf = dao.openSession();
		Criteria criteria=sf.createCriteria(LMUser.class);
		criteria.add(Restrictions.eq("lco_id",user));
		Long l= (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}
	
	
	

	
	public List userListForSearch(String user, String username, String desig,String mobile,
			Integer offset, Integer maxResults) {
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(LMUser.class); 
		criteria.add(Restrictions.eq("lco_id",user));
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("mobile",mobile));
		
		if(username==null || username.equalsIgnoreCase(""))
			System.out.println("username is not available");
		else
		criteria.add(Restrictions.eq("username",username));
		
		if(desig==null || desig.equalsIgnoreCase(""))
			System.out.println("desig is not available");
		else
		criteria.add(Restrictions.eq("designation",desig));
		
		
		List l= criteria
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10)
				.list();
		sf.close();
		return l;
	}
	
	
	public Long countForSearch(String user, String username, String desig,String mobile){
		Session sf=dao.openSession();
		Criteria criteria = sf.createCriteria(LMUser.class); 
		criteria.add(Restrictions.eq("lco_id",user));
		
		if(mobile==null || mobile.equalsIgnoreCase(""))
			System.out.println("mobile is not available");
		else
		criteria.add(Restrictions.eq("mobile",mobile));
		
		if(username==null || username.equalsIgnoreCase(""))
			System.out.println("username is not available");
		else
		criteria.add(Restrictions.eq("username",username));
		
		if(desig==null || desig.equalsIgnoreCase(""))
			System.out.println("desig is not available");
		else
		criteria.add(Restrictions.eq("designation",desig));
		
		Long l= (Long)criteria
				.setProjection(Projections.rowCount())
				.uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public List<String> getAllAgentNames(String lco) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(LMUser.class);
		cr.add(Restrictions.eq("lco_id",lco));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("firstName"));
		cr.setProjection(proList); 

		List l= cr.list();
		sf.close();
		return l;
	}
	
	@Override
	public String getLCOID(String username) {
		Session sf = dao.openSession();
		Criteria c2 = sf.createCriteria(LMUser.class);
		c2.add(Restrictions.eq("username", Long.parseLong(username)));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("lco_id"));
		c2.setProjection(proList); 
		String product=c2.uniqueResult()+"";
		sf.close();
		return product;
	}

}
