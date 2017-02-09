package com.dialnet.source.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dialnet.source.model.STBStock;
import com.dialnet.source.model.VCStock;

@Repository
public class STBStockDaoImpl implements STBStockDao {

	@Autowired
	SessionFactory dao;

	@Override
	public void add(STBStock stock) {
		Session sf = dao.openSession();
		sf.save(stock);
		sf.close();
	}
	
	@Override
	public List<STBStock> getAllVCStock() {
		Session sf = dao.openSession();
		List l= (List<STBStock>) sf.createCriteria(STBStock.class).list();
		sf.close();
		return l;
	}

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
	public List<STBStock> getByStatus(String status) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		// To get records having salary more than 2000
		cr.add(Restrictions.eq("current_status", status));
		List product =cr.list();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public int upSTB(String stb, String status) {
		Session sf = dao.openSession();
		Query query = sf
				.createSQLQuery("update lco_stb_box set current_status = :docname" + " where stb_box_no = :docId");
		query.setParameter("docname", status);
		query.setParameter("docId", stb);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	
	/////////////////////////////////////////////////////////For  Pagination/////////////////////////////////////////////////////

	public List<STBStock> list(Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		List l= sf.createCriteria(STBStock.class).setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	public Long count() {
		Session sf = dao.openSession();
		Long l= (Long) sf.createCriteria(STBStock.class).setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	
}
