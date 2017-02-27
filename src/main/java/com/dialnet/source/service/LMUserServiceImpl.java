package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.LMUserDao;
import com.dialnet.source.model.LMUser;

@Service("LMservice")
public class LMUserServiceImpl implements LMUserService {

	@Autowired
	LMUserDao dao; 
	
	@Override
	public void add(LMUser username) {
		dao.add(username);

	}

	@Override
	public int edit(LMUser obj) {
		return dao.edit(obj);
	}

	@Override
	public void delete(String username) {

	}

	@Override
	public LMUser get(String username) {
		return dao.get(username);
	}

	@Override
	public List<LMUser> getAll() {
		return dao.getAll();
	}

	@Override
	public boolean findByLogin(String id, String pwd) {
		System.out.println("Username\t"+id +"\tPassword\t"+pwd);
		LMUser stud = dao.get(id);
		if(stud==null){
			return false;	
		}
		else if(stud != null && stud.getPASSWORD().equals(pwd)) {
			return true;
		} else
			return false;	
	}



	@Override
	public List<String> getAllAgentNames(String lco) {
		return dao.getAllAgentNames( lco);
	}

	@Override
	public String getLCOID(String username) {
		return dao.getLCOID(username);
	}

	@Override
	public List<LMUser> list(String user, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.list(user, offset, maxResults);
	}

	@Override
	public Long count(String user) {
		// TODO Auto-generated method stub
		return dao.count(user);
	}

	@Override
	public List userListForSearch(String user, String username, String desig, String mobile,
			Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.userListForSearch(user, username, desig, mobile, offset, maxResults);
	}

	@Override
	public Long countForSearch(String user,  String username, String desig, String mobile) {
		// TODO Auto-generated method stub
		return dao.countForSearch(user, username, desig, mobile);
	}

}
