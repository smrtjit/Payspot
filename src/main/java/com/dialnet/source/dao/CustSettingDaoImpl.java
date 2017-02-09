package com.dialnet.source.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.dialnet.source.model.LCO_Setting;


@Repository("lcosettingdao")
public class CustSettingDaoImpl implements CustSettingDao {
	
	@Autowired
	SessionFactory dao;

	@Override
	public LCO_Setting getByID(String id) {
		Session sf = dao.openSession();
		Criteria c = sf.createCriteria(LCO_Setting.class);
		c.add(Restrictions.eq("lco_id", id));
		LCO_Setting l=(LCO_Setting)c.uniqueResult();
		sf.close();
		return l;
		
	}

}
