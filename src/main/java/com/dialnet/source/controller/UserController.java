
package com.dialnet.source.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.dialnet.source.model.User;
import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.UserLogin;
import com.dialnet.source.service.AllComplaintService;
import com.dialnet.source.service.PackageInfoService;
import com.dialnet.source.service.SubscriberService;

@Controller
@SessionAttributes("custLogin")
public class UserController {

	@Autowired
	public AllComplaintService userComplaintService;

	@Autowired
	public SubscriberService subservice;
	
	@Autowired
	PackageInfoService packageinfoservice;


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
				User found = subservice.get(studentLogin.getUserName());
				// System.out.println("LCO Controller LcoCode:
				// "+found.getLoc_code());
				ModelAndView model = new ModelAndView("redirect:UserDetail.html");
				
				model.addObject("id", studentLogin.getUserName());
				/*
				model.addObject("UserName", found.getCustomer_name());
				model.addObject("vc_no", found.getCustomer_vc_no());
				model.addObject("stb_no", found.getCustomer_stb_no());

				PackageInfo lco = packageinfoservice.getByID(found.getPackage_name());
				model.addObject("Package_name", lco.getName());
				//model.addObject("Package_name", "0001");
				model.addObject("Account_balance", found.getAccount_balance());
				model.addObject("Last_payment", found.getLast_payment());
				// model.addObject("Account_balance", found.get);
				model.addObject("Last_recharge_date", found.getLast_recharge_date());
				model.addObject("mobile", found.getCustomer_mobile());
				model.addObject("email", found.getCustomer_email());
				model.addObject("add", found.getCustomer_add());
*/
				return model;
			} else {
				// return "userlogin";
				return new ModelAndView("userlogin", "error", "Invalid Username or Password");
			}
		}

	}

	@RequestMapping(value = "/UserDetail", method = RequestMethod.GET)
	public ModelAndView LCODEtail(@ModelAttribute("UserDetail") User studentLogin, @RequestParam("id") String id,
			BindingResult result) {
		System.out.println("LCO Controller LcoCode: " + id);
		if (result.hasErrors()) {
			// return "lcologin";
			return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			User found = subservice.get(id);
			
			ModelAndView model = new ModelAndView("CustAccount");
			model.addObject("id", found.getUsername());
			model.addObject("UserName", found.getCustomer_name());
			model.addObject("vc_no", found.getCustomer_vc_no());
			model.addObject("stb_no", found.getCustomer_stb_no());
			PackageInfo lco = packageinfoservice.getByName(found.getPackage_name());
			model.addObject("Package_name", lco.getPckgName());
			model.addObject("Account_balance", found.getAccount_balance());
			model.addObject("Last_payment", found.getLast_payment());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getLast_recharge_date());
			model.addObject("mobile", found.getCustomer_mobile());
			model.addObject("email", found.getCustomer_email());
			model.addObject("add", found.getCustomer_add());
			return model;
		}
	}

	@RequestMapping(value = "/CustRecharge", method = RequestMethod.GET)
	public ModelAndView CustRecharge(@ModelAttribute("UserDetail") User studentLogin, @RequestParam("id") String id,
			BindingResult result) {
		System.out.println("LCO Controller LcoCode: " + id);
		if (result.hasErrors()) {
			// return "lcologin";
			return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			User found = subservice.get(id);
			System.out.println("LCO Controller LcoCode: " + found.getCustomer_name());
			ModelAndView model = new ModelAndView("Custrecharge");
			model.addObject("id", found.getUsername());
			model.addObject("UserName", found.getCustomer_name());
			model.addObject("vc_no", found.getCustomer_vc_no());
			PackageInfo lco = packageinfoservice.getByID(found.getPackage_name());
			model.addObject("Package_name", lco.getPckgName());
			model.addObject("Package_cost", lco.getPrice());
			model.addObject("Account_balance", found.getAccount_balance());
			model.addObject("Last_payment", found.getLast_payment());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getLast_recharge_date());
			// model.addObject("mobile", found.getCustomer_mobile());
			// model.addObject("email", found.getCustomer_email());
			// model.addObject("add", found.getCustomer_add());

			return model;
		}

	}

	@RequestMapping(value = "/payNow", method = RequestMethod.GET)
	public ModelAndView payNow(ModelMap map, @RequestParam("vc_no") String vc_no,
			@RequestParam("Customer_name") String Customer_name, @RequestParam("pckg") String pckg,
			@RequestParam("pckg_price") String pckg_price, @RequestParam("amount") String amount,
			@RequestParam("id") String id) {
		ModelAndView md = new ModelAndView("Custpaynow");
		md.addObject("id", id);
		md.addObject("vc_no", vc_no);
		md.addObject("Customer_name", Customer_name);
		md.addObject("pckg", pckg);
		md.addObject("pckg_price", pckg_price);
		md.addObject("amount", amount);
		System.out.println(id + "*******************************");
		return md;
	}

	@RequestMapping(value = "/saveComplaint", method = RequestMethod.POST)
	public ModelAndView saveComplaint(ModelMap map, @RequestParam("vc_no") String vc_no,
			@RequestParam("Customer_name") String Customer_name, @RequestParam("pckg") String pckg,
			@RequestParam("pckg_price") String pckg_price, @RequestParam("amount") String amount,
			@RequestParam("id") String id) {
		ModelAndView md = new ModelAndView("Custpaynow");
		md.addObject("id", id);
		md.addObject("vc_no", vc_no);
		md.addObject("Customer_name", Customer_name);
		md.addObject("pckg", pckg);
		md.addObject("pckg_price", pckg_price);
		md.addObject("amount", amount);
		System.out.println(id + "*******************************");
		return md;
	}

	@RequestMapping(value = "/CustComplaint", method = RequestMethod.GET)
	public ModelAndView CustComplaint(@ModelAttribute("UserDetail") User studentLogin, @RequestParam("vc_no") String vcc,
			@RequestParam("id") String id, BindingResult result) {
		System.out.println("CustComplaint Controller LcoCode: " + vcc + "," + id);
		ModelAndView model = new ModelAndView("CustComplaint");
		if (result.hasErrors()) { // return "lcologin"; return new
			 return new ModelAndView("userlogin", "error", "There are some Errors");

		} else {
			List<AllComplaints> found = userComplaintService.getComplaintByVC(vcc);
//			for(AllComplaints tmp: found){
//				System.out.println("Value1: "+tmp.getCustomer_vcno());
//			}
			model.addObject("id", id);
			model.addObject("vc_no", vcc);
			model.addObject("userList", found);
			return model;
		}

		
	}


	@RequestMapping(value = "/addComplaint", method = RequestMethod.GET)
	public ModelAndView addComplaint(ModelMap map, @RequestParam("vc_no") String vcc, @RequestParam("id") String id,
			@RequestParam("lcomplaint") String camptype, @RequestParam("remark") String remark) {
		User found = subservice.findByVCNO(id);
		String user = found.getUsername() + "";
		//System.out.println("id: " + id + ",vcc: " + vcc + ",camptype: " + camptype + ",remark: " + remark);

		AllComplaints tmp = new AllComplaints();
		// tmp.setComplaint_no();
		tmp.setComplaint_type(camptype);
		tmp.setComplaint_status("Open");
		tmp.setCustomer_vcno(vcc);
		tmp.setCust_remark(remark);
		tmp.setOpen_date(new Date().toString());
		tmp.setClosing_remark("NA");
		tmp.setClosing_date("NA");
		tmp.setCreater_Id(user);
		tmp.setCustomer_name(found.getCustomer_name());
		tmp.setCustomer_add(found.getCustomer_add());
		tmp.setCustomer_mobile(found.getCustomer_mobile());

		userComplaintService.add(tmp);
		List<AllComplaints> userList = userComplaintService.getComplaintByVC(id);
		map.addAttribute("userList", userList);
		map.addAttribute("id", id);
		map.addAttribute("vc_no", vcc);
		return new ModelAndView("CustComplaint", map);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		session = null;
		// System.out.println("Session Ends: "+session);
		return "logout";
	}

}
