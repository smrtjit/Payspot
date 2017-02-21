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
		return subsriberdao.getByLCOId(lco, offset, maxResults);
	}

	@Override
	public long count(String lco) {
		return subsriberdao.count(lco);
	}

	@Override
	public Subscriber getByID(String id) {
		return subsriberdao.getByID(id);
	}

	@Override
	public List<Subscriber> findByAnyone(String user, String sdate, String edate, String stb_no, String VC_no,
			String mobile, String status, String pckg, Integer offset, Integer maxResults) {
		return subsriberdao.findByAnyone(user, sdate, edate, stb_no, VC_no, mobile, status, pckg, offset, maxResults);
	}

	@Override
	public Long countForSearch(String user, String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg) {
		return subsriberdao.countForSearch(user, sdate, edate, stb_no, VC_no, mobile, status, pckg);
	}

	@Override
	public int addSubscriber(Subscriber sub) {
		return subsriberdao.addSubscriber(sub);
	}


	@Override
	public int updateConnection(String username, String firstname, String middlename, String lastname, String mobile,
			String email, String address, String landmark, String state, String city, String pincode, String stbno,
			String accountblance) {
		
		return subsriberdao.updateConnection(username, firstname, middlename, lastname, mobile, email, address, landmark, state, city, pincode, stbno, accountblance) ;
	}


	
}
