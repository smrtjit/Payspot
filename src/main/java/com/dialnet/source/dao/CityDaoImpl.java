package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.AllChannels;
import com.dialnet.source.model.Citys;

@Repository
public class CityDaoImpl implements CitysDao {
	
	@Autowired
	SessionFactory dao;
	
	@Override
	public List<String> getBycity_state(String city_state) {
		Session sf = dao.openSession();
		Criteria criteria = sf.createCriteria(Citys.class);
		criteria.add(Restrictions.eq("city_state", city_state));
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.property("city_name"));
		criteria.setProjection(proList);
		List l = criteria.list();
		sf.close();
		return l;
	}

}
