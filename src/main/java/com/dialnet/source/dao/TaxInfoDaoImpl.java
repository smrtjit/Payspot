package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.TaxInformation;



@Repository
public class TaxInfoDaoImpl implements TaxInfoDao {
	
	@Autowired
	SessionFactory dao;

	@Override
	public TaxInformation getInfo(String id) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(TaxInformation.class);
		//cr.add(Restrictions.eq("lco_id", id));
		TaxInformation product = (TaxInformation)cr.uniqueResult();
		System.out.println("Package Code: " + product+",LCO Id: "+id);
		sf.close();
		return product;
	}

	
}
