package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
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
	public List<AllChannels> getListByLCO(String lco, Integer offset, Integer maxResults) {
		Session sf = session.openSession();
		Criteria criteria = sf.createCriteria(AllChannels.class);
		
		criteria.add(Restrictions.eq("lco_id", lco));
		
		List l = criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	@Override
	public Long count(String user) {
		Session sf = session.openSession();
		Criteria c2 = sf.createCriteria(AllChannels.class);
		c2.add(Restrictions.eq("lco_id", user));
		Long l = (Long) c2.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int add(AllChannels chn) {
		Session sf = session.openSession();
		Transaction tx = sf.beginTransaction();
		sf.save(chn);
		tx.commit();
		sf.close();
		return 1;
	}

	@Override
	public List<String> getAllName(String lco) {
		Session sf = session.openSession();
		Criteria criteria = sf.createCriteria(AllChannels.class);
		criteria.add(Restrictions.eq("lco_id", lco));
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.property("channel_name"));
		criteria.setProjection(proList);
		List l = criteria.list();
		sf.close();
		return l;
	}

	@Override
	public int delete(String channel_id) {
		Session sf = session.openSession();
		Transaction tx = sf.beginTransaction();
		AllChannels tmp = (AllChannels) sf.load(AllChannels.class, Long.parseLong(channel_id));
		sf.delete(tmp);
		tx.commit();
		sf.close();
		return 1;

	}

	@Override
	public int channelupdate(String channelid, String channelname, String msoprice, String lcoprice) {
		Session sf = session.openSession();
		Query query = sf.createSQLQuery(
				"update channels set channel_name = :channelname , mso_price = :msoprice, lco_price = :lcoprice "
						+ " where channel_id = :docId");
		query.setParameter("channelname", channelname);
		query.setParameter("msoprice", msoprice);
		query.setParameter("lcoprice", lcoprice);
		query.setParameter("docId", channelid);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	@Override
	public Long countFTA(String user) {
		Session sf = session.openSession();
		Criteria c2 = sf.createCriteria(AllChannels.class);
		c2.add(Restrictions.eq("lco_id", user));
		c2.add(Restrictions.eq("lco_price", "Free"));
		Long l = (Long) c2.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		
		return l;
	}

}
