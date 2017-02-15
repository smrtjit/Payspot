package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.dialnet.source.model.PackageDetail;

@Repository
@Transactional
public class PackageDetailDaoImpl implements PackageDetailDao {

	@Autowired
	SessionFactory session;
	
	@Override
	public int add(PackageDetail obj) {
		Session sf = session.openSession();
		Transaction tx= sf.beginTransaction();
		sf.save(obj);
		tx.commit();
		sf.close();
		//System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public int delete(String id) {
		Session sf = session.openSession();
		Transaction tx= sf.beginTransaction();
		String hql = "delete from PackageDetail where Pckg_Id= :uid";
		  Query query = sf.createQuery(hql);
		  query.setString("uid", id);
		  query.executeUpdate();
		  tx.commit();
		  sf.close();
		
		return 1;
	}

}
