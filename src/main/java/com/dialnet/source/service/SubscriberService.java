package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.Subscriber;


public interface SubscriberService {

	public List<Subscriber> getByLCOId(String lco,Integer offset,Integer maxResults);
	public long count(String lco);
	public Subscriber getByID(String id);
	public boolean findByLogin(String id, String pwd);
	public List<Subscriber> findByAnyone(String user,String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg,Integer offset,Integer maxResults);
	public Long countForSearch(String user,String sdate, String edate, String stb_no, String VC_no, String mobile,
			String status, String pckg);
	public int addSubscriber(Subscriber sub);
}
