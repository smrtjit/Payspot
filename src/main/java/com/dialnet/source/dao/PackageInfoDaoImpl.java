package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.PackageInfo;

@Repository("pack")
public class PackageInfoDaoImpl implements PackageInfoDao {

	
	@Autowired
	private SessionFactory session;

	public PackageInfo getByID(String code) {
		System.out.println("PackageInfo\t"+code);
		Session sf = session.openSession();
//		Criteria c2 = sf.createCriteria(PackageInfo.class);
//		c2.add(Restrictions.eq("code", code));
//		//AllComplaints product = (AllComplaints) sf.get(AllComplaints.class, Long.parseLong(complaints_No));
//		//System.out.println("customer_vcno: " + product);
//		PackageInfo tmp=(PackageInfo)c2.uniqueResult();
		PackageInfo l= (PackageInfo)sf.get(PackageInfo.class, Long.parseLong(code));
		sf.close();
		 return l;
	}

	public List<PackageInfo> getAll() {
		Session sf = session.openSession();
		List l= sf.createQuery("from PackageInfo").list();
		sf.close();
		return l;
	}

	@Override
	public List<String> getAllPckgNames() {
		Session sf = session.openSession();
		Criteria cr = sf.createCriteria(PackageInfo.class);
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("name"));
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
		cr.add(Restrictions.eq("name", name));
		PackageInfo product = (PackageInfo) cr.uniqueResult();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}
	

}
