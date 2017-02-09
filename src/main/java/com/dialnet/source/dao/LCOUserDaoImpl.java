package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.dialnet.source.model.LCOUser;

@Transactional
@Repository("lcodao")
public class LCOUserDaoImpl implements LCOUserDao {

	@Autowired
	private SessionFactory dao;
	
	@Override
	public void add(LCOUser complaints) {
		Session sf = dao.openSession();
		sf.save(complaints);
		sf.close();
	}

	@Override
	public void edit(LCOUser complaints) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int complaints_No) {
		

	}

	@Override
	public LCOUser get(String username) {
		
		Session sf = dao.openSession();
		Criteria c2 = sf.createCriteria(LCOUser.class);
		c2.add(Restrictions.eq("login_id", username));
		System.out.println("LCOUser Id: "+username);
		LCOUser product = (LCOUser) c2.uniqueResult();
		//LCOUser product = (LCOUser) sf.get(LCOUser.class, Long.parseLong(username));
		System.out.println("LCO User: "+product);
		sf.close();
		return product;
	}

	@Override
	public List getAll() {
		Session sf = dao.openSession();
		List l= sf.createCriteria(LCOUser.class).list();
		sf.close();
		return l;
	}



	

}
