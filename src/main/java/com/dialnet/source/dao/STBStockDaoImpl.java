package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.STBStock;

@Repository
public class STBStockDaoImpl implements STBStockDao {

	@Autowired
	SessionFactory dao;

	

	@Override
	public STBStock getBySTBNo(String stb) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("stb_box_no", stb));
		STBStock product = (STBStock) cr.uniqueResult();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public List<STBStock> getByStatus(String user,String status) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		cr.add(Restrictions.eq("LcoId", user));
		cr.add(Restrictions.eq("StbStatus", status));
		List product =cr.list();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}


	/////////////////////////////////////////////////////////For  Pagination/////////////////////////////////////////////////////

	public List<STBStock> list(String user,Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria cr=sf.createCriteria(STBStock.class);
		cr.add(Restrictions.eq("LcoId", user));
		List l= cr.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		Session sf = dao.openSession();
		Criteria cr=sf.createCriteria(STBStock.class);
		cr.add(Restrictions.eq("LcoId", user));
		Long l= (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public List<String> getAllAvlSTB(String user) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		cr.add(Restrictions.eq("LcoId", user));
		cr.add(Restrictions.eq("StbStatus", "OffLine"));
		ProjectionList proList = Projections.projectionList(); 
		proList.add(Projections.property("StbNo"));
		cr.setProjection(proList); 
		List product =cr.list();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	
}
