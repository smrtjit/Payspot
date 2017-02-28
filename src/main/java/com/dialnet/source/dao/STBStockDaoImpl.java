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

import com.dialnet.source.model.PackageInfo;
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
		cr.add(Restrictions.eq("Stb_Id", stb));
		STBStock product = (STBStock) cr.uniqueResult();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public List<STBStock> getByStatus(String user, String status) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		cr.add(Restrictions.eq("LcoId", user));
		cr.add(Restrictions.eq("StbStatus", status));
		List product = cr.list();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	///////////////////////////////////////////////////////// For
	///////////////////////////////////////////////////////// Pagination/////////////////////////////////////////////////////

	public List<STBStock> list(String user, Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);
		cr.addOrder(Order.desc("trndate_Of_Subs"));
		cr.add(Restrictions.eq("LCO_Id", user));
		List l = cr.setFirstResult(offset != null ? offset : 0).setMaxResults(maxResults != null ? maxResults : 10)
				.list();
		sf.close();
		return l;
	}

	public Long count(String user) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);
		cr.add(Restrictions.eq("LCO_Id", user));
		Long l = (Long) cr.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public List<String> getAllAvlSTB(String user) {
		Session sf = dao.openSession();
		Criteria cr = sf.createCriteria(STBStock.class);

		cr.add(Restrictions.eq("LCO_Id", user));
		cr.add(Restrictions.eq("STB_Status", "OffLine"));
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.property("Stb_Id"));
		cr.setProjection(proList);
		List product = cr.list();
		// System.out.println("user: " + product);
		sf.close();
		return product;
	}

	@Override
	public List<STBStock> getBySearch(String user, String id, String mso, String brand, String type, String status,
			Integer offset, Integer maxResults) {
		Session sf = dao.openSession();
		Criteria criteria = sf.createCriteria(STBStock.class);
		criteria.add(Restrictions.eq("LCO_Id", user));
		if (id == null || id.equalsIgnoreCase("")) {
			System.out.println("Stb_Id is not available");
		} else {
			criteria.add(Restrictions.eq("Stb_Id", Long.parseLong(id)));
		}

		if (mso == null || mso.equalsIgnoreCase(""))
			System.out.println("MSO is not available");
		else {
			criteria.add(Restrictions.eq("MSO", mso));
		}

		if (brand == null || brand.equalsIgnoreCase(""))
			System.out.println("Brand is not available");
		else {
			criteria.add(Restrictions.eq("Brand", brand.trim()));
		}

		if (type == null || type.equalsIgnoreCase(""))
			System.out.println("STB_Type is not available");
		else
			criteria.add(Restrictions.eq("STB_Type", type));

		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("STB_Status is not available");
		else
			criteria.add(Restrictions.eq("STB_Status", status));

		List l = criteria.setFirstResult(offset != null ? offset : 0)
				.setMaxResults(maxResults != null ? maxResults : 10).list();
		sf.close();
		return l;
	}

	

	@Override
	public int delete(String id) {
		Session sf = dao.openSession();
		STBStock obj = (STBStock) sf.get(STBStock.class, Long.parseLong(id));
		Transaction tx = sf.beginTransaction();
		sf.delete(obj);
		tx.commit();
		sf.close();
		// System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public long countSearch(String user, String id, String mso, String brand, String type, String status) {
		Session sf = dao.openSession();
		Criteria criteria = sf.createCriteria(STBStock.class);
		criteria.add(Restrictions.eq("LCO_Id", user));
		if (id == null || id.equalsIgnoreCase("")) {
			System.out.println("Stb_Id is not available");
		} else {
			criteria.add(Restrictions.eq("Stb_Id", Long.parseLong(id)));
		}

		if (mso == null || mso.equalsIgnoreCase(""))
			System.out.println("MSO is not available");
		else {
			criteria.add(Restrictions.eq("MSO", mso));
		}

		if (brand == null || brand.equalsIgnoreCase(""))
			System.out.println("Brand is not available");
		else {
			criteria.add(Restrictions.eq("Brand", brand.trim()));
		}

		if (type == null || type.equalsIgnoreCase(""))
			System.out.println("STB_Type is not available");
		else
			criteria.add(Restrictions.eq("STB_Type", type));

		if (status == null || status.equalsIgnoreCase(""))
			System.out.println("STB_Status is not available");
		else
			criteria.add(Restrictions.eq("STB_Status", status));

		Long l = (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		sf.close();
		return l;
	}

	@Override
	public int add(STBStock pckg) {
		Session sf = dao.openSession();
		Transaction tx = sf.beginTransaction();
		sf.save(pckg);
		tx.commit();
		sf.close();
		// System.out.println("Save AgentBillDetails done");
		return 1;
	}

	@Override
	public int update(String stbno,String warranty) {
		Session sf = dao.openSession();
		Query query = sf.createSQLQuery("update STB_Stock set Warranty = :st where Stb_Id = :id");
		query.setParameter("id", stbno);
		query.setParameter("st", warranty);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

	@Override
	public int updatesubscriber(String stbno, String sub_id, String trn_date, String status) {
		Session sf = dao.openSession();
		String qry="update STB_Stock set SubscriberId = :sub_id,trndate_Of_Subs= :trn_date,STB_Status= :status where Stb_Id = :id";
		Query query = sf.createSQLQuery(qry);
		query.setParameter("id",stbno);
		query.setParameter("sub_id",sub_id);
		query.setParameter("trn_date", trn_date);
		query.setParameter("status", status);
		int result = query.executeUpdate();
		sf.beginTransaction().commit();
		sf.close();
		return result;
	}

}
