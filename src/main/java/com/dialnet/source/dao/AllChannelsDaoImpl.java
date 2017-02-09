package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.AllChannels;





@Repository
public class AllChannelsDaoImpl implements AllChannelsDao {
	
	@Autowired
	SessionFactory session;

	@Override
	public List<AllChannels> getListByLCO(String lco, Integer offset,Integer maxResults) {
		Session sf=session.openSession();
		Criteria criteria=sf.createCriteria(AllChannels.class);
		criteria.add(Restrictions.eq("lco_id",lco));
		List l= criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	@Override
	public Long count(String user) {
		Session sf=session.openSession();
		Criteria c2 = sf.createCriteria(AllChannels.class);
		c2.add(Restrictions.eq("lco_id", user));
		Long l= (Long)c2
				.setProjection(Projections.rowCount())
				.uniqueResult();
		sf.close();
		return l;
	}

}
