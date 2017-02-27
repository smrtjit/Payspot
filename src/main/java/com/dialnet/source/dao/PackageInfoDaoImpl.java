package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.model.PackageInfo;

@Transactional
@Repository("pack")
public class PackageInfoDaoImpl implements PackageInfoDao {

	
	@Autowired
	private SessionFactory session;

	public PackageInfo getByID(String code) {
		Session sf = session.openSession();
		Criteria criteria=sf.createCriteria(PackageInfo.class);
		criteria.add(Restrictions.eq("PckgID",code));
		PackageInfo l= (PackageInfo)criteria.uniqueResult();
		sf.close();
		 return l;
	}

	public List<PackageInfo> getAll(String user,Integer offset,Integer maxResults) {
		Session sf=session.openSession();
		Criteria criteria=sf.createCriteria(PackageInfo.class);
		criteria.add(Restrictions.eq("LcoID",user));
		List l= criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}
	
	public Long count(String user) {
		Session sf = session.openSession();
		Criteria cr=sf.createCriteria(PackageInfo.class);
		cr.add(Restrictions.eq("LcoID",user));
		Long l= (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public List<String> getAllPckgNames() {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("PckgName"));
		cr.setProjection(proList); 

		List l= cr.list();
		sf.close();
		return l;
	}
	
	@Override
	public PackageInfo getByName(String name) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("PckgName", name));
		PackageInfo product = (PackageInfo) cr.uniqueResult();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public int add(PackageInfo pckg) {
		Session sf = session.openSession();
		Transaction tx= sf.beginTransaction();
		sf.save(pckg);
		tx.commit();
		sf.close();
		//System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public int delete(String id) {
		
		Session sf = session.openSession();
		PackageInfo obj=(PackageInfo)sf.get(PackageInfo.class, id);
		Transaction tx= sf.beginTransaction();
		sf.delete(obj);
		tx.commit();
		sf.close();
		//System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public int editPckg(PackageInfo pckg) {
		Session sf = session.openSession();
		Transaction tx= sf.beginTransaction();
		sf.saveOrUpdate(pckg);
		tx.commit();
		sf.close();
		return 1;
	}

	@Override
	public List<String> getPckgByType(String user, String type) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);
		cr.add(Restrictions.eq("LcoID", user));
		cr.add(Restrictions.eq("PckgType", type));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("PckgName"));
		cr.setProjection(proList); 

		List l= cr.list();
		sf.close();
		return l;
	}

	@Override
	public long getCostByName(String name) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);
		cr.add(Restrictions.eq("PckgName", name));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("Price"));
		cr.setProjection(proList); 

		long l= (Long)cr.uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public String getNoOfChn(String name) {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);
		cr.add(Restrictions.eq("PckgName", name));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("NoOfChannels"));
		cr.setProjection(proList); 

		String l= cr.uniqueResult()+"";
		sf.close();
		return l;
	}
	

}
