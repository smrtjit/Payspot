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
		// TODO Auto-generated method stub

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
	public List<LMUser> list(Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.list(offset, maxResults);
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List userListForSearch(String empid, String username, String desig, String mobile, Integer offset,
			Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.userListForSearch(empid, username, desig, mobile, offset, maxResults);
	}

	@Override
	public Long countForSearch(String empid, String username, String desig, String mobile) {
		// TODO Auto-generated method stub
		return dao.countForSearch(empid, username, desig, mobile);
	}

	@Override
	public List<String> getAllAgentNames(String lco) {
		// TODO Auto-generated method stub
		return dao.getAllAgentNames( lco);
	}

}
