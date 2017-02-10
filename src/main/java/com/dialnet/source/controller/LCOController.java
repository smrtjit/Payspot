
package com.dialnet.source.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dialnet.source.model.AgentBillDetails;
import com.dialnet.source.model.AllChannels;
import com.dialnet.source.model.AllCollections;
import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.BulkRechargeAmount;
import com.dialnet.source.model.BulkRechargeAmountList;
import com.dialnet.source.model.Cust_Invoice;
import com.dialnet.source.model.Customer_Invoice1;
import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.LCO_Setting;
import com.dialnet.source.model.LMUser;
import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.STBStock;
import com.dialnet.source.model.TaxInformation;
import com.dialnet.source.model.User;
//import com.dialnet.source.model.LCOUserRegistration;
import com.dialnet.source.model.UserLogin;
import com.dialnet.source.model.VCStock;
import com.dialnet.source.service.AgentBillDetailsService;
import com.dialnet.source.service.AllChannelService;
import com.dialnet.source.service.AllCollectionService;
import com.dialnet.source.service.AllComplaintService;
import com.dialnet.source.service.CustSettingService;
import com.dialnet.source.service.Cust_InvoiceService;
import com.dialnet.source.service.CustomerInvoiceServiceImpl;
import com.dialnet.source.service.LCOUserService;
import com.dialnet.source.service.LMUserService;
import com.dialnet.source.service.PackageInfoService;
import com.dialnet.source.service.STBStockService;
import com.dialnet.source.service.SubscriberService;
import com.dialnet.source.service.TaxInfoService;
import com.dialnet.source.service.VCStockService;
import com.google.gson.Gson;

@Controller
@SessionAttributes("lcoLogin")
public class LCOController {

	@Autowired
	public LCOUserService lcoService;

	@Autowired
	public SubscriberService userService;

	@Autowired
	public AllComplaintService LCOComplaintRepository;

	@Autowired
	public AllCollectionService LCOCollectionRepository;

	@Autowired
	public STBStockService stbService;

	@Autowired
	public VCStockService vcService;

	@Autowired
	LMUserService lmuserservice;

	@Autowired
	PackageInfoService pckgservice;

	@Autowired
	TaxInfoService taxService;

	@Autowired
	Cust_InvoiceService invoice;

	@Autowired
	CustSettingService settingService;

	@Autowired
	CustomerInvoiceServiceImpl invoice1;

	@Autowired
	AgentBillDetailsService agentbillservice;
	
	@Autowired
	AllChannelService channelService;

	String imagename = null;

	@RequestMapping(value = "/lcologin", method = RequestMethod.GET)
	public String login(Model model) {
		UserLogin studentLogin = new UserLogin();
		model.addAttribute("lcoLogin", studentLogin);
		return "lcologin";
	}

	@RequestMapping(value = "/lcologin", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("lcoLogin") UserLogin studentLogin, BindingResult result, ModelMap map,
			RedirectAttributes redir) {
		if (result.hasErrors()) {
			// return "lcologin";
			map.addAttribute("error", "There is some Errors");
			// return new ModelAndView("lcologin", "error", "There is some
			// Errors");
			return "lcologin";

		} else {
			boolean found = lcoService.findByLogin(studentLogin.getUserName(), studentLogin.getPassword());
			String user = studentLogin.getUserName();
			if (found) {
				map.addAttribute("user", user);
				// return new ModelAndView("redirect:LCOHome.html", map);
				return "redirect:LCOHome.html?user=" + user;
			} else {
				map.addAttribute("error", "Invalid Username or Password!!!");
				// return new ModelAndView("lcologin", "error", "Invalid
				// Username or Password!!!");
				return "lcologin";
			}
		}

	}

	@RequestMapping(value = "/LCOHome", method = RequestMethod.GET)
	public String lcohome(ModelMap map, @RequestParam("user") String user) {
		map.addAttribute("user", user);
		return "LCOHome";
	}

	@RequestMapping(value = "/newConnn", method = RequestMethod.GET)
	public String newConnn(ModelMap map, @RequestParam("user") String user) {
		map.addAttribute("user", user);
		return "NewConnection";
	}
	
	@RequestMapping(value = "/newLineman", method = RequestMethod.GET)
	public String newLineman(ModelMap map, @RequestParam("user") String user) {
		map.addAttribute("user", user);
		return "NewLineMan";
	}

	
	@RequestMapping(value = "/newChannel", method = RequestMethod.GET)
	public String newChannel(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		map.addAttribute("user", user);
		List<AllChannels> l=channelService.getListByLCO(user,offset,maxResults);
		map.addAttribute("count", channelService.count(user));
		map.addAttribute("offset", offset);
		for(AllChannels tmp: l){
			System.out.println("NAME: "+tmp.getChannel_name());
		}
		map.addAttribute("ChannelList", l);
		return "NewChannel";
	}
	
	@RequestMapping(value = "/lcoDetail", method = RequestMethod.GET)
	public String lcoProfile(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		
		map.addAttribute("user", user);
		LCOUser lco=lcoService.get(user);
		map.addAttribute("LCODetail", lco);
		return "LCOProfile";
	}
	
	@RequestMapping(value = "/newPackage", method = RequestMethod.GET)
	public ModelAndView newPackage(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		List<PackageInfo> l=pckgservice.getAll(user, offset, maxResults);
		for(PackageInfo tmp: l){
			System.out.println("NAME of Packages: "+tmp.getPckgName());
		}
		map.addAttribute("PckgList", l);
		map.addAttribute("count", pckgservice.count(user));
		map.addAttribute("offset", offset);
	map.addAttribute("user", user);
	return new ModelAndView("NewPackage",map);
	}
	
	@RequestMapping(value = "/allSubscriber", method = RequestMethod.GET)
	public ModelAndView allSubscriber(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("AllUsers",map);
	}
	
	@RequestMapping(value = "/allCollection", method = RequestMethod.GET)
	public ModelAndView allCollection(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("AllCollection",map);
	}
	
	@RequestMapping(value = "/allComplaint", method = RequestMethod.GET)
	public ModelAndView allComplaint(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("AllComp",map);
	}
	
	@RequestMapping(value = "/topUp", method = RequestMethod.GET)
	public ModelAndView topUp(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("Topup",map);
	}
	
	@RequestMapping(value = "/allLM", method = RequestMethod.GET)
	public ModelAndView allLM(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("AllLineMan",map);
	}
	
	@RequestMapping(value = "/stock", method = RequestMethod.GET)
	public ModelAndView stock(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("TotalStock",map);
	}
	
	@RequestMapping(value = "/addStock", method = RequestMethod.GET)
	public ModelAndView addStock(ModelMap map, @RequestParam("user") String user,Integer offset,
			Integer maxResults) {
		
	map.addAttribute("user", user);
	return new ModelAndView("AddNewStock",map);
	}
	
	
	

}
