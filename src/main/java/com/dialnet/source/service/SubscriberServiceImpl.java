package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.SubscriberDao;
import com.dialnet.source.model.Subscriber;



@Service
public class SubscriberServiceImpl implements SubscriberService {

	@Autowired
	private SubscriberDao subsriberdao;


	public boolean findByLogin(String userName, String password) {
		System.out.println("Username\t" + userName + "\tPassword\t" + password);
		Subscriber stud = subsriberdao.getByID(userName);
		System.out.println("Username\t" + stud.getUserName() + "\tPassword\t" + stud.getPassword());
		if (stud == null) {
			return false;
		} else if (stud != null && stud.getPassword().equals(password)) {
			return true;
		} else
			return false;
	}


	@Override
	public List<Subscriber> getByLCOId(String lco, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return subsriberdao.getByLCOId(lco, offset, maxResults);
	}


	@Override
	public long count(String lco) {
		// TODO Auto-generated method stub
		return subsriberdao.count(lco);
	}


	@Override
	public Subscriber getByID(String id) {
		// TODO Auto-generated method stub
		return subsriberdao.getByID(id);
	}


	@Override
	public List<Subscriber> findByAnyone(String user, String sdate, String edate, String stb_no, String VC_no,
			String mobile, String status, String pckg, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return subsriberdao.findByAnyone(user, sdate, edate, stb_no, VC_no, mobile, status, pckg, offset, maxResults);
	}


	@Override
	public Long countForSearch(String user, String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg) {
		// TODO Auto-generated method stub
		return subsriberdao.countForSearch(user, sdate, edate, stb_no, VC_no, mobile, status, pckg);
	}


	@Override
	public int addSubscriber(Subscriber sub) {
		// TODO Auto-generated method stub
		return subsriberdao.addSubscriber(sub);
	}

	

	

	
}
