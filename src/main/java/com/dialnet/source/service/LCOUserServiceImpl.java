package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.LCOUserDao;
import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.User;

@Service("lcoservice")
public class LCOUserServiceImpl implements LCOUserService {

	@Autowired
	LCOUserDao dao;
	
	
	@Override
	public void add(LCOUser complaints) {
		dao.add(complaints);;
		
	}

	@Override
	public void edit(LCOUser complaints) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int complaints_No) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LCOUser get(String username) {
		return dao.get(username);
	}

	@Override
	public List<LCOUser> getAll() {
		return dao.getAll();
	}

	public boolean findByLogin(String userName, String password) {	
		System.out.println("Username\t"+userName +"\tPassword\t"+password);
		LCOUser stud = dao.get(userName);
		//System.out.println("Table Data Username\t"+stud.getLogin_id() +"\tPassword\t"+stud.getPassword());
		if(stud==null){
			return false;	
		}
		else if(stud != null && stud.getPassword().equals(password)) {
			return true;
		} else
			return false;	
	}

}
