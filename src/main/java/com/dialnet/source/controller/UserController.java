
package com.dialnet.source.controller;

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
			PackageInfo lco = packageinfoservice.getByID(found.getBasePCKG());
			model.addObject("Package_name", lco.getPckgName());
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
			model.addObject("basepackage", lco.getPckgName());
			model.addObject("alacarte", found.getA_La_Carte());
			model.addObject("addonpack", found.getAddOnPCKG());
			
			model.addObject("Package_cost", lco.getPrice());
			model.addObject("Account_balance", found.getAccountBalance());
			model.addObject("Last_payment", found.getPCKGPrice());
			// model.addObject("Account_balance", found.get);
			model.addObject("Last_recharge_date", found.getSTB_IssuedOn());
			// model.addObject("mobile", found.getCustomer_mobile());
			// model.addObject("email", found.getCustomer_email());
			// model.addObject("add", found.getCustomer_add());

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
			List<AllComplaints> found = userComplaintService.getComplaintByNo(id);
			// for(AllComplaints tmp: found){
			// System.out.println("test Part 11: "+tmp.getComplaint_no());
			// }
			model.addObject("count",userComplaintService.count(id) );
			model.addObject("id", id);
			model.addObject("userList", found);
			return model;
		}

	}

	@RequestMapping(value = "/addComplaint", method = RequestMethod.GET)
	public ModelAndView addComplaint(ModelMap map, @RequestParam("user") String id,
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
		tmp.setOpen_date(new Date().toString());
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
		List<AllComplaints> userList = userComplaintService.getComplaintByNo(id);
		map.addAttribute("userList", userList);
		map.addAttribute("id", id);

		return new ModelAndView("redirect:CustComplaint.html", map);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		session = null;
		// System.out.println("Session Ends: "+session);
		return "logout";
	}

}
