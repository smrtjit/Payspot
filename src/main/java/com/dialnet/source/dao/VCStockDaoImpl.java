package com.dialnet.source.dao;

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

import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.VCStock;


@Repository
public class VCStockDaoImpl implements VCStockDao {
	
	@Autowired
	SessionFactory dao;

	@Override
	public void add(VCStock stock) {
		Session sf = dao.openSession();
		sf.save(stock);
		sf.close();
	}
	
	@Override
	public List<VCStock> getAllVCStock() {
		System.out.println("Check call getAllVCStock VCStockDaoImpl");
		Session sf=dao.openSession();
		List l= (List<VCStock>) sf.createCriteria(VCStock.class).list();
		sf.close();
		return l;
	}

	@Override
	public VCStock getByVCNo(String stb) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(VCStock.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("vc_no", stb));
		VCStock product = (VCStock)cr.uniqueResult();
		//System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public List<VCStock> getByStatus(String stutus) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(VCStock.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("current_status", stutus));
		List<VCStock> product = cr.list();
		//System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public int upStatus(String vcn, String status) {
		Session sf = dao.openSession();
		Query query = sf.createSQLQuery("update lco_vc_no set current_status = :docname" + " where vc_no = :docId");
		query.setParameter("docname",status);
		query.setParameter("docId", vcn);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	////////////////////////////////////////////For Pagination////////////////////////////////////////////
	
	public List<VCStock> list(Integer offset, Integer maxResults){
		Session sf=dao.openSession();
		List l= sf.createCriteria(VCStock.class)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10)
				.list();
		sf.close();
		return l;
	}
	
	
	public Long count(){
		Session sf=dao.openSession();
		Long l= (Long)sf.createCriteria(VCStock.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
		sf.close();
		return l;
	}
}
