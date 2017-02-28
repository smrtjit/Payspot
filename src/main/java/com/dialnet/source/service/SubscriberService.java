package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.Subscriber;


public interface SubscriberService {

	public List<Subscriber> getByLCOId(String lco,Integer offset,Integer maxResults);
	
	public long count(String lco);
	public Subscriber getByID(String id);
	public Subscriber getByMobile(String id);

	public boolean findByLogin(String id, String pwd);
	public List<Subscriber> findByAnyone(String user,String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg,Integer offset,Integer maxResults);
	public Long countForSearch(String user,String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg);
	public int addSubscriber(Subscriber sub);
	public int updateConnection(String username,String firstname,String middlename,
			String lastname,String mobile,String email,String address,String landmark,
			String state,String city,String pincode,String stbno ,String accountblance );
	public int updateSubscriberBill(String username,String accountblance);
	public List<Subscriber> getAll(String lco);
}
