package com.dialnet.source.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.dialnet.source.model.Subscriber;
import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.Customer_Invoice1;
import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.UserLogin;
import com.dialnet.source.service.AllComplaintService;
import com.dialnet.source.service.CustomerInvoiceServiceImpl;
import com.dialnet.source.service.PackageInfoService;
import com.dialnet.source.service.SubscriberService;
import com.google.gson.Gson;

@Controller
@SessionAttributes("custLogin")
public class UserController {

	@Autowired
	public AllComplaintService userComplaintService;

	@Autowired
	public SubscriberService subservice;

	@Autowired
	PackageInfoService packageinfoservice;

	@Autowired
	CustomerInvoiceServiceImpl invoice1;

	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public String Userlogin(Model model) {
		UserLogin studentLogin = new UserLogin();
		model.addAttribute("custLogin", studentLogin);
		return "userlogin";
	}

	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public ModelAndView Userlogin(@Valid @ModelAttribute("custLogin") UserLogin studentLogin, BindingResult result) {
		if (result.hasErrors()) {

			return new ModelAndView("userlogin", "error", "There is some Error!!!");
		} else {
			boolean found1 = subservice.findByLogin(studentLogin.getUserName(), studentLogin.getPassword());
			if (found1) {
				String user = studentLogin.getUserName();
				Subscriber found = subservice.getByID(studentLogin.getUserName());
				// System.out.println("LCO Controller LcoCode:
				// "+found.getLoc_code());
				ModelAndView model = new ModelAndView("redirect:UserDetail.html");

				model.addObject("id", studentLogin.getUserName());

				return model;
			} else {
				// return "userlogin";
				return new ModelAndView("userlogin", "error", "Invalid Username or Password");
			}
		}

	}

	@RequestMapping(value = "/UserDetail", method = RequestMethod.GET)
	public ModelAndView LCODEtail(@ModelAttribute("UserDetail") Subscriber studentLogin, @RequestParam("id") String id,
			BindingResult result) {
		System.out.println("LCO Controller LcoCode: " + id);
		if (result.hasErrors()) {
			// return "lcologin";
			return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			Subscriber found = subservice.getByID(id);

			ModelAndView model = new ModelAndView("CustAccount");
			model.addObject("id", found.getUserName());
			model.addObject("UserName", found.getFirstName());
			model.addObject("vc_no", found.getCRFNo());
			model.addObject("stb_no", found.getSTBNo());
			//PackageInfo lco = packageinfoservice.getByID(found.getBasePCKG());
			model.addObject("Package_name", found.getBasePCKG());
			model.addObject("Account_balance", found.getAccountBalance());
			model.addObject("Last_payment", found.getPCKGPrice());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getSTB_IssuedOn());
			model.addObject("mobile", found.getMobile());
			model.addObject("email", found.getEmailId());
			model.addObject("add", found.getAddress());
			return model;
		}
	}

	@RequestMapping(value = "/CustRecharge", method = RequestMethod.GET)
	public ModelAndView CustRecharge(@ModelAttribute("UserDetail") Subscriber studentLogin,
			@RequestParam("id") String id, BindingResult result) {
		System.out.println("LCO Controller LcoCode: " + id);
		if (result.hasErrors()) {
			// return "lcologin";
			return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			Subscriber found = subservice.getByID(id);
			System.out.println("LCO Controller LcoCode: " + found.getFirstName());
			ModelAndView model = new ModelAndView("Custrecharge");
			model.addObject("id", found.getUserName());
			model.addObject("UserName", found.getFirstName());
			model.addObject("vc_no", id);
			
			PackageInfo lco = packageinfoservice.getByID(found.getBasePCKG());
			
			long baseprice=0;
			model.addObject("basepackage",found.getBasePCKG());
			
			
			PackageInfo ala_carte=null;
			String text = found.getA_La_Carte();
			String a11="";
			String a22="";
			for(String mapadd : text.split(",")) {
				a11=a11+mapadd+",";
				ala_carte=packageinfoservice.getByName(mapadd);
				a22=a22+ala_carte.getPrice()+",";
				baseprice=baseprice+ala_carte.getPrice();
			} 
			
			
			model.addObject("ala_pack", a11);
			model.addObject("ala_price", a22);
			
			PackageInfo add_on=null;;
			String text1 = found.getAddOnPCKG();
			String a1="";
			String a2="";
			for(String mapadd1 : text1.split(",")) {
				a1=a1+mapadd1+",";
				add_on=packageinfoservice.getByName(mapadd1);
				a2=a2+add_on.getPrice()+",";
				System.out.println("a2\t"+a2);
				baseprice=baseprice+add_on.getPrice();
			}
			
			model.addObject("add_pck",a1 );
			model.addObject("add_prce",a2 );

			long tmp=Long.parseLong(found.getPCKGPrice());
			baseprice=tmp-baseprice;
			model.addObject("basepackageprice", baseprice);
			
			model.addObject("Package_cost", tmp);
			model.addObject("Account_balance", found.getAccountBalance());
			model.addObject("Last_payment", found.getPCKGPrice());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getSTB_IssuedOn());
	
			model.addObject("Package_cost",found.getPCKGPrice());
			model.addObject("Account_balance", found.getAccountBalance());
			model.addObject("Last_payment", found.getPCKGPrice());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getSTB_IssuedOn());
		

			return model;
		}

	}

	@ResponseBody
	@RequestMapping(value = "/customerBill", method = RequestMethod.GET)
	public String printBill(@RequestParam("user") String user, ModelMap model) {
		Gson gson = new Gson();
		String json = null;
		System.out.println("Invoice Details check data:" + user);
		Customer_Invoice1 result = invoice1.getByCustomerId(user);
		if (result != null) {
			json = gson.toJson(result);
			System.out.println("Result: " + result.getInvoice_No());
		} else
			json = gson.toJson("Data Not Found");
		System.out.println("Contrtoller Execute");

		model.addAttribute("id", user);
		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/payNow", method = RequestMethod.GET)
	public ModelAndView payNow(ModelMap map, @RequestParam("vc_no") String vc_no,
			@RequestParam("Customer_name") String Customer_name, @RequestParam("pckg") String pckg,
			@RequestParam("pckg_price") String pckg_price, @RequestParam("amount") String amount,
			@RequestParam("id") String id) {
		ModelAndView md = new ModelAndView("Custpaynow");
		md.addObject("id", id);
		md.addObject("vc_no", id);
		md.addObject("Customer_name", Customer_name);
		md.addObject("pckg", pckg);
		md.addObject("pckg_price", pckg_price);
		md.addObject("amount", amount);
		System.out.println(id + "*******************************");
		return md;
	}

	@RequestMapping(value = "/saveComplaint", method = RequestMethod.POST)
	public ModelAndView saveComplaint(ModelMap map, @RequestParam("Customer_name") String Customer_name,
			@RequestParam("pckg") String pckg, @RequestParam("pckg_price") String pckg_price,
			@RequestParam("amount") String amount, @RequestParam("id") String id) {
		ModelAndView md = new ModelAndView("Custpaynow");
		md.addObject("id", id);

		md.addObject("Customer_name", Customer_name);
		md.addObject("pckg", pckg);
		md.addObject("pckg_price", pckg_price);
		md.addObject("amount", amount);
		System.out.println(id + "*******************************");
		return md;
	}

	@RequestMapping(value = "/CustComplaint", method = RequestMethod.GET)
	public ModelAndView CustComplaint(@ModelAttribute("UserDetail") Subscriber studentLogin, Integer offset, Integer maxResults,
			@RequestParam("id") String id, BindingResult result) {
		ModelAndView model = new ModelAndView("CustComplaint");
		if (result.hasErrors()) {
			return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			System.out.println("test Part id\t" + id);
			List<AllComplaints> found = userComplaintService.getComplaintByNo(id, offset, maxResults);
			// for(AllComplaints tmp: found){
			// System.out.println("test Part 11: "+tmp.getComplaint_no());
			// }
			model.addObject("count",userComplaintService.countForAll(id) );
			model.addObject("id", id);
			model.addObject("offset", offset);
			model.addObject("userList", found);
			return model;
		}

	}

	@RequestMapping(value = "/addComplaint", method = RequestMethod.GET)
	public ModelAndView addComplaint(ModelMap map, @RequestParam("user") String id,Integer offset, Integer maxResults,
			@RequestParam("lcomplaint") String camptype, @RequestParam("remark") String remark) {
		Subscriber found = subservice.getByID(id);
		String user = found.getFirstName() + "";

		System.out.println("test Part id\t" + id);
		AllComplaints tmp = new AllComplaints();

		tmp.setComplaint_type(camptype);
		tmp.setComplaint_status("Open");
		long compleateid = System.currentTimeMillis();

		tmp.setComplaint_no(compleateid);
		tmp.setCust_remark(remark);
		tmp.setOpen_date(getDate());
		tmp.setClosing_remark("NA");
		tmp.setClosing_date("NA");
		tmp.setCustomer_caf("NA");
		System.out.println("found.getLcoId()\t" + found.getLcoId());
		tmp.setCreater_Id(id);
		tmp.setLco_id(found.getLcoId());
		tmp.setCustomer_name(found.getFirstName());
		tmp.setCustomer_add(found.getAddress());
		tmp.setCustomer_mobile(found.getMobile());
		System.out.println("Test parts 1");
		userComplaintService.add(tmp);
		System.out.println("Test parts 2");
		List<AllComplaints> userList =userComplaintService.getComplaintByNo(id, offset, maxResults);
		map.addAttribute("userList", userList);
		map.addAttribute("id", id);
		map.addAttribute("offset", offset);

		return new ModelAndView("redirect:CustComplaint.html", map);
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		session = null;
		// System.out.println("Session Ends: "+session);
		return "logout";
	}
	
	@RequestMapping(value = "/custbill", method = RequestMethod.GET)
	public ModelAndView billDownload(ModelMap map, @RequestParam("id") String user, Integer offset,
			Integer maxResults) {
		List<Customer_Invoice1> subs = invoice1.listForSingleUser(user,offset,maxResults);
		map.addAttribute("userList", subs);
		map.addAttribute("count", invoice1.countForSingleUser(user));
		map.addAttribute("id", user);
		return new ModelAndView("CustBillDownload", map);
	}
	
	public String getDate() {
		String trnstamp = null;
		try {
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = new Date();
			String strDate = sdfDate.format(now);
			// System.out.println(strDate.toString());
			trnstamp = strDate.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return trnstamp;
	}

}