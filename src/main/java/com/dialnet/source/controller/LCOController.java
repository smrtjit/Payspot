
package com.dialnet.source.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;

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
import com.dialnet.source.model.BulkStock;
import com.dialnet.source.model.Citys;
import com.dialnet.source.model.Customer_Invoice1;
import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.LCO_Setting;
import com.dialnet.source.model.LMUser;
import com.dialnet.source.model.PackageDetail;
import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.STBStock;
import com.dialnet.source.model.Subscriber;

//import com.dialnet.source.model.LCOUserRegistration;
import com.dialnet.source.model.UserLogin;

import com.dialnet.source.service.AgentBillDetailsService;
import com.dialnet.source.service.AllChannelService;
import com.dialnet.source.service.AllCollectionService;
import com.dialnet.source.service.AllComplaintService;
import com.dialnet.source.service.CityService;
import com.dialnet.source.service.CustSettingService;
import com.dialnet.source.service.CustomerInvoiceServiceImpl;
import com.dialnet.source.service.LCOUserService;
import com.dialnet.source.service.LMUserService;
import com.dialnet.source.service.PackageDetailSercie;
import com.dialnet.source.service.PackageInfoService;
import com.dialnet.source.service.STBStockService;
import com.dialnet.source.service.SubscriberService;
import com.dialnet.source.service.TaxInfoService;

import com.google.gson.Gson;

@Controller
@SessionAttributes("lcoLogin")
public class LCOController {

	@Autowired
	public LCOUserService lcoService;

	@Autowired
	public SubscriberService userService;

	@Autowired
	public AllComplaintService comservice;

	@Autowired
	public AllCollectionService LCOCollectionRepository;

	@Autowired
	public STBStockService stbService;

	@Autowired
	LMUserService lmuserservice;

	@Autowired
	PackageInfoService pckgservice;

	@Autowired
	TaxInfoService taxService;

	@Autowired
	CustSettingService settingService;

	@Autowired
	CustomerInvoiceServiceImpl invoice1;

	@Autowired
	AgentBillDetailsService agentbillservice;

	@Autowired
	AllChannelService channelService;

	@Autowired
	PackageDetailSercie pckgDetialservice;

	@Autowired
	CityService citystate;

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
		Subscriber sub = new Subscriber();
		map.addAttribute("NewSubscriber", sub);
		List<String> basic = pckgservice.getPckgByType(user, "Basic");
		map.addAttribute("BASIC", basic);

		List<String> stb = stbService.getAllAvlSTB(user);
		map.addAttribute("STB", stb);
		map.addAttribute("user", user);
		return "NewConnection";
	}

	@RequestMapping(value = "/billDownload", method = RequestMethod.GET)
	public ModelAndView billDownload(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		List<Customer_Invoice1> subs = invoice1.list(user, offset, maxResults);
		map.addAttribute("userList", subs);
		map.addAttribute("count", invoice1.count(user));
		map.addAttribute("user", user);
		return new ModelAndView("BillDownload", map);
	}

	@ResponseBody
	@RequestMapping(value = "/printBill", method = RequestMethod.GET)
	public String printBill(@RequestParam("user") String user, @RequestParam("invoice") String invoiceid,
			ModelMap model) {
		Gson gson = new Gson();
		String json = null;
		System.out.println("Invoice Details check data: " + invoiceid + "," + user);
		Customer_Invoice1 result = invoice1.getByInvoiceId(invoiceid);
		System.out.println("result\t" + invoiceid);

		if (result != null) {
			json = gson.toJson(result);
			System.out.println("Result: " + result.getInvoice_No());
		} else
			json = gson.toJson("Data Not Found");

		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/newLineman", method = RequestMethod.GET)
	public String newLineman(ModelMap map, @RequestParam("user") String user) {
		LMUser lm = new LMUser();
		List profftype = new ArrayList();
		profftype.add("PAN Card");
		profftype.add("Adhaar Card");
		profftype.add("Passport");
		profftype.add("Driving License");
		profftype.add("Arms Licence");
		profftype.add("Election Commission ID Card ");
		map.addAttribute("LMUSER", lm);
		map.addAttribute("profftype", profftype);
		map.addAttribute("user", user);
		return "NewLineMan";
	}

	@RequestMapping(value = "/addLMUser", method = RequestMethod.GET)
	public ModelAndView addLMUser(ModelMap map, @RequestParam("user") String user,
			@ModelAttribute("LMUSER") LMUser lmuser) {

		long id = System.currentTimeMillis();
		lmuser.setUsername(id);
		lmuser.setLco_id(user);
		lmuser.setTrnadate(getDate());

		lmuser.setPASSWORD(getSaltString());

		lmuserservice.add(lmuser);

		System.out.println("Data Secuessfully Store");
		map.addAttribute("user", user);
		return new ModelAndView("redirect:newLineman.html", map);
	}

	@RequestMapping(value = "/newChannel", method = RequestMethod.GET)
	public ModelAndView newChannel(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		// AllChannels chn=new AllChannels();
		// map.addAttribute("AllChn", chn);
		map.addAttribute("user", user);
		List<AllChannels> l = channelService.getListByLCO(user, offset, maxResults);
		map.addAttribute("count", channelService.count(user));
		map.addAttribute("offset", offset);
		// for(AllChannels tmp: l){
		// System.out.println("NAME: "+tmp.getChannel_name());
		// }
		map.addAttribute("ChannelList", l);
		return new ModelAndView("NewChannel", map);
	}

	@ResponseBody
	@RequestMapping(value = "/addSingleChn", method = RequestMethod.GET)
	public String addStudent(@RequestParam("chnName") String chn, @RequestParam("msoPrice") String mso,
			@RequestParam("lcoPrice") String lco, ModelMap model, @RequestParam("user") String user) {
		String result = null;
		long id = System.currentTimeMillis();
		System.out.println("Form Data: " + chn + ",mso: " + mso + ",lco: " + lco + "," + user + "," + id);
		AllChannels newchn = new AllChannels();
		newchn.setChannel_id(id);
		newchn.setChannel_name(chn);
		newchn.setLco_price(lco);
		newchn.setMso_price(mso);
		newchn.setLco_id(user);
		newchn.setUpdated_on(getDate());
		int val = channelService.add(newchn);
		// int val=1;
		System.out.println("value: " + val);
		if (val == 1) {
			result = "New Channel Added Successfully!!!";
		} else {
			result = "There may be Some Error Please Try Again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		model.addAttribute("user", user);
		return result;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/lcoDetail", method = RequestMethod.GET)
	public String lcoProfile(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {

		map.addAttribute("user", user);
		LCOUser lco = lcoService.get(user);
		map.addAttribute("LCODetail", lco);
		return "LCOProfile";
	}

	@RequestMapping(value = "/newPackage", method = RequestMethod.GET)
	public ModelAndView newPackage(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		PackageInfo pck = new PackageInfo();
		map.addAttribute("PckgInfo", pck);
		List ls = channelService.getAllName(user);
		map.addAttribute("ChnList", ls);
		////////////////////////////////////////////////////////////////////////
		List ls2 = new ArrayList();
		ls2.add("Select Type");
		ls2.add("Basic");
		ls2.add("Add On");
		ls2.add("A-La-Carte");
		map.addAttribute("type", ls2);
		List<PackageInfo> l = pckgservice.getAll(user, offset, maxResults);
		// for (PackageInfo tmp : l) {
		// System.out.println("NAME of Packages: " + tmp.getPckgName());
		// }
		map.addAttribute("PckgList", l);
		map.addAttribute("count", pckgservice.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("user", user);
		return new ModelAndView("NewPackage", map);
	}

	@RequestMapping(value = "/allSubscriber", method = RequestMethod.GET)
	public ModelAndView allSubscriber(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		List<Subscriber> subs = userService.getByLCOId(user, offset, maxResults);
		Subscriber updatealluser = new Subscriber();
		map.addAttribute("userList", subs);
		map.addAttribute("updatealluser", updatealluser);
		map.addAttribute("count", userService.count(user));
		map.addAttribute("user", user);
		return new ModelAndView("AllUsers", map);
	}

	@RequestMapping(value = "/allCollection", method = RequestMethod.GET)
	public ModelAndView allLCOCollection(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		List<AllCollections> userList = LCOCollectionRepository.list(user, offset, maxResults);
		System.out.println("Calling....allCollection");
		map.addAttribute("count", LCOCollectionRepository.count(user));
		map.addAttribute("offset", offset);
		/*
		 * for (AllCollections temp : userList) {
		 * System.out.println("User Name: "+temp.getCust_Name()+",Invoice No.: "
		 * +temp.getInvoice());
		 * 
		 * }
		 */
		map.addAttribute("userList", userList);
		map.addAttribute("user", user);
		return new ModelAndView("AllCollectionData", map);

	}

	@RequestMapping(value = "/allComplaint", method = RequestMethod.GET)
	public ModelAndView allComplaint(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		List al = comservice.list(user, offset, maxResults);
		map.addAttribute("userList", al);
		map.addAttribute("count", comservice.count(user));
		map.addAttribute("user", user);
		return new ModelAndView("AllComp", map);
	}

	@RequestMapping(value = "/topUp", method = RequestMethod.GET)
	public ModelAndView topUp(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {
		List<BulkRechargeAmount> lstUser = new ArrayList<BulkRechargeAmount>();
		AgentBillDetails cust = new AgentBillDetails();
		List pck = lmuserservice.getAllAgentNames(user);
		List paymentType = new ArrayList();
		paymentType.add("Cash");
		paymentType.add("Cheque");
		paymentType.add("Wallet");
		paymentType.add("Others");
		map.addAttribute("paymentType", paymentType);
		map.addAttribute("agentName", pck);
		map.addAttribute("bulkInfoForm", cust);
		map.addAttribute("user", user);
		map.addAttribute("lstUser", lstUser);
		// map.addAttribute("user", user);
		return new ModelAndView("Topup", map);
	}

	@RequestMapping(value = "/allLM", method = RequestMethod.GET)
	public ModelAndView allLM(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {
		System.out.println("Old User Info Called");
		LMUser userForm = new LMUser();
		map.addAttribute("userForm", userForm);
		List<LMUser> userList = lmuserservice.list(user,offset, maxResults);

		map.addAttribute("count", lmuserservice.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("userList", userList);
		

		map.addAttribute("user", user);
		return new ModelAndView("AllLineMan", map);
	}

	@RequestMapping(value = "/stock", method = RequestMethod.GET)
	public ModelAndView stock(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {

		List<STBStock> stb = stbService.list(user, offset, maxResults);
		map.addAttribute("StbList", stb);
		map.addAttribute("count", stbService.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("user", user);
		return new ModelAndView("TotalStock", map);
	}

	@RequestMapping(value = "/addStock", method = RequestMethod.GET)
	public ModelAndView addStock(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {

		map.addAttribute("user", user);
		return new ModelAndView("AddNewStock", map);
	}

	@RequestMapping(value = "/searchLCOConByLCO", method = RequestMethod.GET)
	public ModelAndView searchOlConByLCO(ModelMap map, @RequestParam("user") String user,
			@ModelAttribute("subForm") Subscriber sub, @RequestParam("name") String name,
			@RequestParam("fdate") String fdate, @RequestParam("edate") String edate,
			@RequestParam("mobile") String mobile, @RequestParam("status") String status,
			@RequestParam("stb_no") String stb, @RequestParam("pckg") String pckg, Integer offset, Integer maxResults) {
		Subscriber userForm = new Subscriber();
		map.addAttribute("subForm", userForm);
		map.addAttribute("user", user);
		System.out.println("status in searchLCOConByLCO: " + status);
		if (status.equals("0"))
			status = "";
		List<Subscriber> tmp = userService.findByAnyone(user, fdate, edate, stb, name, mobile, status, pckg, offset,
				maxResults);
		System.out.println("tmp.size()***************: " + tmp.size());
		if (tmp.size() < 1) {

			map.addAttribute("error", "No Data Found!!!");
			map.addAttribute("count", "0");
			map.addAttribute("offset", offset);
			System.out.println("No Data Found........................");
		} else {
			map.addAttribute("count", userService.countForSearch(user, fdate, edate, stb, name, mobile, status, pckg));
			map.addAttribute("offset", offset);
			map.addAttribute("userList", tmp);
		}

		return new ModelAndView("AllUsers", map);
	}

	@RequestMapping(value = "/searchLMByLCO", method = RequestMethod.GET)
	public String searchLCOUserByLCO(@RequestParam("user") String user, Model model, Integer offset, Integer maxResults,
			@RequestParam("username") String id, @RequestParam("desig") String desig,
			@RequestParam("mobile") String mobile) {
		LMUser userForm = new LMUser();
		model.addAttribute("userForm", userForm);
		ArrayList<String> departments = new ArrayList<String>();
		departments.add("Select Repsonsibility");
		departments.add("Collection");
		departments.add("Local Fault Repair");
		departments.add("Others");
		model.addAttribute("resp", departments);
		List<LMUser> tmp = lmuserservice.userListForSearch(user,id, desig, mobile, offset, maxResults);
		if (tmp.size() > 0) {
			System.out.println("Data Found size:........................" + tmp.size());
			model.addAttribute("count", lmuserservice.countForSearch(user, id, desig, mobile));
			model.addAttribute("offset", offset);
		} else {

			model.addAttribute("error", "No Data Found!!!");
			model.addAttribute("count", "0");
			model.addAttribute("offset", offset);
			System.out.println("No Data Found........................");
		}
		model.addAttribute("userList", tmp);
		model.addAttribute("user", user);
		return "AllLineMan";
	}

	@RequestMapping(value = "/searchComplaint", method = RequestMethod.GET)
	public ModelAndView searchComplaint(ModelMap map, @RequestParam("user") String user,
			@RequestParam("VC_No") String VC_No, @RequestParam("fdate") String fdate,
			@RequestParam("edate") String edate, @RequestParam("mobile") String mobile,
			@RequestParam("status") String status, Integer offset, Integer maxResults) {
		map.addAttribute("user", user);
		System.out.println("VC no: " + VC_No + "user: " + user);
		List<AllComplaints> tmp = comservice.listForSearch(user, fdate, edate, VC_No, mobile, status, offset,
				maxResults);

		System.out.println("tmp.size()***************: " + tmp.size());
		if (tmp.size() < 1) {
			map.addAttribute("error", "No Data Found!!!");
			map.addAttribute("count", "0");
			map.addAttribute("offset", offset);
			System.out.println("No Data Found........................");
		} else {
			map.addAttribute("userList", tmp);
			map.addAttribute("count", comservice.countForSearch(user, fdate, edate, VC_No, mobile, status));
			map.addAttribute("offset", offset);
		}

		return new ModelAndView("AllComp", map);
	}

	/**************************************************/

	@ResponseBody
	@RequestMapping(value = "/channelList", method = RequestMethod.POST)
	public ModelAndView channelList(ModelMap model, @RequestParam("excelfile") MultipartFile excelfile,
			@RequestParam("user") String id) {
		try {

			List<AllChannels> lstUser = new ArrayList<AllChannels>();
			int i = 0;
			System.out.println("file not found name \t" + excelfile.getInputStream());
			// File file= new File();
			HSSFWorkbook workbook = new HSSFWorkbook(excelfile.getInputStream());
			String ss = excelfile.getName();
			HSSFSheet worksheet = workbook.getSheetAt(0);
			int noOfColumns = worksheet.getRow(0).getLastCellNum();
			System.out.println("Column count \t" + noOfColumns);
			if (noOfColumns == 3) {
				while (i <= worksheet.getLastRowNum()) {
					AllChannels user = new AllChannels();
					HSSFRow row = worksheet.getRow(i++);
					user.setChannel_name(row.getCell(0).getStringCellValue());
					System.out.println("I am here 0\t " + row.getCell(0));
					if (row.getCell(1).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						user.setMso_price(row.getCell(1).getNumericCellValue() + "");
					} else {
						user.setMso_price(row.getCell(1).getStringCellValue());
					}

					if (row.getCell(2).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						user.setLco_price(row.getCell(2).getNumericCellValue() + "");
						System.out.println("I am here 000 \t" + row.getCell(2));
					} else {
						user.setLco_price(row.getCell(2).getStringCellValue());
						System.out.println("I am here 000 \t" + row.getCell(2));
					}

					user.setLco_id(id);
					long channel_id = System.currentTimeMillis();
					user.setChannel_id(channel_id);
					user.setUpdated_on(getDate());
					channelService.add(user);

				}

				model.addAttribute("user", id);
			} else {
				model.addAttribute("error", "File is Not Valid");
				model.addAttribute("user", id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:newChannel.html", model);
	}

	@RequestMapping(value = "/searchCollectionLCO", method = RequestMethod.GET)
	public ModelAndView searchByanyOne(ModelMap map, @RequestParam("user") String user,
			@RequestParam("VC_No") String VC_No, @RequestParam("fdate") String fdate,
			@RequestParam("edate") String edate, @RequestParam("mobile") String mobile,
			@RequestParam("status") String status, @RequestParam("agent") String agent, Integer offset,
			Integer maxResults) {
		map.addAttribute("user", user);
		System.out.println("VC no: " + VC_No);
		List<AllCollections> tmp = LCOCollectionRepository.getByAnyOne(user, fdate, edate, VC_No, mobile, status, agent,
				offset, maxResults);

		System.out.println("tmp.size()***************: " + tmp.size());
		if (tmp.size() < 1) {
			map.addAttribute("userList", tmp);
			map.addAttribute("count", "0");
			map.addAttribute("error", "No Data Found!!!");
			System.out.println("No Data Found........................");
		} else {
			map.addAttribute("userList", tmp);
			map.addAttribute("count",
					LCOCollectionRepository.countForSearch(user, fdate, edate, VC_No, mobile, status, agent));
			map.addAttribute("offset", offset);
		}

		return new ModelAndView("AllCollectionData", map);
	}

	@ResponseBody
	@RequestMapping(value = "/addNewPckg", method = RequestMethod.GET)
	public String addNewPckg(@RequestParam("pckg") String pckg, @RequestParam("type") String type, Model model,
			@RequestParam("price") String price, @RequestParam("chnlist") String chnList,
			@RequestParam("user") String user) {
		String result = null;
		String list[] = chnList.split(",");
		long id = System.currentTimeMillis();
		System.out.println("Form Data: " + pckg + ",price: " + price + ",type: " + type + "," + user + "," + chnList);
		PackageInfo obj = new PackageInfo();
		obj.setPckgID(id + "");
		obj.setLcoID(user);
		obj.setNoOfUser("0");
		obj.setPckgName(pckg);
		obj.setPckgType(type);
		obj.setPrice(Long.parseLong(price));
		obj.setTrnadte(getDate());
		obj.setNoOfChannels(list.length + "");
		int val = pckgservice.add(obj);
		// int val=1;
		System.out.println("value: " + val);
		if (val == 1) {
			for (int k = 0; k < list.length; k++) {
				PackageDetail tmp = new PackageDetail();
				tmp.setPckg_Id(id + "");
				tmp.setChannel_Name(list[k]);
				pckgDetialservice.add(tmp);
			}
			result = "New Channel Added Successfully!!!";
		} else {
			result = "There may be Some Error Please Try Again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/updateLM", method = RequestMethod.POST)
	public ModelAndView updateLM(@ModelAttribute("userForm") LMUser sub, ModelMap model,
			@RequestParam("user") String user, @RequestParam("lmID") String lmid) {
		String result = null;
		System.out.println("updateLM User: " + user + ",LMID: " + lmid);
		LMUser lm = lmuserservice.get(lmid);
		sub.setUsername(Long.parseLong(lmid));
		sub.setIdentity_proof(lm.getIdentity_proof());
		sub.setAdd_proof(lm.getAdd_proof());
		sub.setAdd_proof_image_Name(lm.getAdd_proof_image_Name());
		sub.setAdd_proof_type(lm.getAdd_proof_type());
		sub.setIdentity_proof_image_name(lm.getIdentity_proof_image_name());
		sub.setIdentity_proof_type(lm.getIdentity_proof_type());
		sub.setLco_id(lm.getLco_id());
		sub.setTrnadate(lm.getTrnadate());
		int i = lmuserservice.edit(sub);
		model.addAttribute("user", user);
		return new ModelAndView("redirect:allLM.html", model);
		//
	}

	@ResponseBody
	@RequestMapping(value = "/updateConnection", method = RequestMethod.GET)
	public String updateConnection(Integer offset, Integer maxResults, ModelMap model,
			@RequestParam("user") String user, @RequestParam("username") String username,
			@RequestParam("fname") String fname, @RequestParam("mname") String mname,
			@RequestParam("lname") String lname, @RequestParam("mob") String mob, @RequestParam("email") String email,
			@RequestParam("adds") String adds, @RequestParam("land") String land, @RequestParam("state") String state,
			@RequestParam("city") String city, @RequestParam("pincode") String pincode,
			@RequestParam("stbno") String stbno, @RequestParam("blance") String blance) {
		int val = userService.updateConnection(username, fname, mname, lname, mob, email, adds, land, state, city,
				pincode, stbno, blance);
		String result;
		System.out.println("value: " + val);
		if (val == 1) {
			result = "Connection Update Successfully!!!";
		} else {
			result = "There may be Some Error Please Try Again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		model.addAttribute("user", user);
		return json;

	}

	@RequestMapping(value = "/ApprovedBulkLCO", method = RequestMethod.GET)
	public ModelAndView ApprovedBulkLCO(@RequestParam("user") String user, @RequestParam("invoice") String id,
			@RequestParam("RAmt") String RAmt, @RequestParam("state") String status, @RequestParam("RId") String RId,
			@RequestParam("Remark") String Remark, ModelMap model) {
		System.out.println("ApprovedBulkLCO1: " + user + "," + RAmt + "," + status + "," + RId + "," + Remark);
		Customer_Invoice1 ctr = invoice1.getByInvoiceId(id);
		AllCollections col = LCOCollectionRepository.getByInvoice(id);
		int i = LCOCollectionRepository.updateCollection(id, RAmt, user, RId, status, Remark, getDate());
		int i2 = invoice1.updateInvoiceDetail(id, RAmt, col.getCollecting_Agent(), getDate(), status);
		int i3 = agentbillservice.updateAgentBill(id, RAmt, RId, Remark, status, user, getDate());
		model.addAttribute("user", user);
		return new ModelAndView("redirect:allCollection.html", model);
	}

	@ResponseBody
	@RequestMapping(value = "/bulkDetails", method = RequestMethod.GET)
	public String bulkDetails(@RequestParam("user") String user, @RequestParam("invoice") String invoiceid,
			ModelMap model) {
		System.out.println("bulkDetails Invoice Details check data: " + invoiceid + "," + user);

		Customer_Invoice1 result = invoice1.getByInvoiceId(invoiceid);
		AllCollections col = LCOCollectionRepository.getByInvoice(invoiceid);

		System.out.println("Result: " + result.getCustName());
		List ls = new ArrayList();
		ls.add(col);
		ls.add(result);
		Gson gson = new Gson();
		String json = gson.toJson(ls);
		model.addAttribute("user", user);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/updateCompLCO", method = RequestMethod.GET)
	public String updateCompLCO(@RequestParam("user") String user, @RequestParam("id") String cId,
			@RequestParam("remark") String cremark, @RequestParam("status") String status, ModelMap model) {
		System.out.println("Invoice Details check data: " + cId + "," + user + "," + cremark + "," + status);
		int al = comservice.edit(cId, cremark, status);
		String result = null;
		if (al > 0) {
			result = "The Status is Updated Successfully";
		} else {
			result = "There is some Error Please Try again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/updateChannel", method = RequestMethod.GET)
	public String updateChannel(ModelMap map, @RequestParam("user") String user,
			@RequestParam("pkgname") String pkgname, @RequestParam("msoprice") String msoprice,
			@RequestParam("lcoprice") String lcoprice, @RequestParam("chnl_id") String chnl_id, Integer offset,
			Integer maxResults) {
		System.out.println("-" + msoprice + "--------" + lcoprice + "------5555555555555--" + pkgname + "--------------"
				+ chnl_id);
		int val = channelService.channelupdate(chnl_id, pkgname, msoprice, lcoprice);
		map.addAttribute("user", user);
		List<AllChannels> l = channelService.getListByLCO(user, offset, maxResults);
		map.addAttribute("count", channelService.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("ChannelList", l);
		System.out.println("****Channel Secuessfully Update****");
		String result = null;
		if (val > 0) {
			result = "Data Updated Successfully";
		} else {
			result = "There is some Error Please Try again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		map.addAttribute("user", user);
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteChannel", method = RequestMethod.GET)
	public String deleteChannel(ModelMap map, @RequestParam("user") String user,
			@RequestParam("chnl_id") String chnl_id, Integer offset, Integer maxResults) {

		System.out.println("Welcome to Delete Controller parts");
		List<AllChannels> l = channelService.getListByLCO(user, offset, maxResults);
		String result = null;
		System.out.println("chnl_id\t" + chnl_id);
		int val = channelService.delete(chnl_id);
		if (val > 0) {
			result = "Data Successfully Delete";
		} else {
			result = "There is some Error Please Try again";
		}

		Gson gson = new Gson();
		String json = gson.toJson(result);
		map.addAttribute("count", channelService.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("ChannelList", l);
		map.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/deletePackage", method = RequestMethod.GET)
	public String deletePackage(ModelMap map, @RequestParam("user") String user, @RequestParam("pak_id") String pak_id,
			Integer offset, Integer maxResults) {

		System.out.println("Welcome to Delete Controller parts");
		PackageInfo pck = new PackageInfo();
		map.addAttribute("PckgInfo", pck);
		List ls = channelService.getAllName(user);
		map.addAttribute("ChnList", ls);
		List ls2 = new ArrayList();
		ls2.add("Select Type");
		ls2.add("Basic");
		ls2.add("Add On");
		ls2.add("A-La-Carte");
		map.addAttribute("type", ls2);
		List<PackageInfo> l = pckgservice.getAll(user, offset, maxResults);
		map.addAttribute("PckgList", l);
		map.addAttribute("count", pckgservice.count(user));
		map.addAttribute("offset", offset);
		map.addAttribute("user", user);
		String result = null;

		int val = pckgservice.delete(pak_id);

		if (val > 0) {
			int chk = pckgDetialservice.delete(pak_id);
			System.out.println("Check for delete: " + chk);
			if (chk > 0) {
				result = "Data Deleted Successfully!!! ";
			} else {
				result = "There is some Error Please Try again";
			}

		} else {
			result = "There is some Error Please Try again";
		}

		Gson gson = new Gson();
		String json = gson.toJson(result);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/getLMDetial", method = RequestMethod.GET)
	public String getLMDetial(@RequestParam("user") String user, @RequestParam("Eid") String eid) {
		String result = null;
		LMUser lm = lmuserservice.get(eid);
		Gson gson = new Gson();
		String json = gson.toJson(lm);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/getCityName", method = RequestMethod.GET)
	public String getCityName(ModelMap map, @RequestParam("user") String user,
			@RequestParam("cityname") String cityname) {
		System.out.println("-" + cityname + "--------------5555555555555------------");
		List<String> citys = citystate.getBycity_state(cityname);
		for (String ss : citys)
			System.out.println("****Channel Secuessfully Update****" + ss);
		Gson gson = new Gson();
		String json = gson.toJson(citys);
		map.addAttribute("user", user);
		map.addAttribute("cityList", citys);
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/getChannelList", method = RequestMethod.GET)
	public String getChannelList(@RequestParam("user") String user, @RequestParam("pckgId") String pckg) {
		String result = null;
		List<String> lm = pckgDetialservice.getChannelByPckg(pckg);
		for (String tmp : lm) {
			System.out.println("Channel List: " + tmp);
		}
		Gson gson = new Gson();
		String json = gson.toJson(lm);

		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/searchStock", method = RequestMethod.GET)
	public ModelAndView searchStock(ModelMap map, @RequestParam("user") String user, @RequestParam("stbId") String stb,
			@RequestParam("mso") String mso, @RequestParam("brand") String brand, @RequestParam("status") String status,
			@RequestParam("type") String type, Integer offset, Integer maxResults) {
		System.out.println(
				"Data for check Stock: " + stb + "," + mso + "," + type + "," + brand + "," + status + "," + user);
		List<STBStock> list = stbService.getBySearch(user, stb, mso, brand, type, status, offset, maxResults);

		if (list.size() > 0) {
			map.addAttribute("StbList", list);
			map.addAttribute("count", stbService.countSearch(user, stb, mso, brand, type, status));
		} else {
			System.out.println("NO DATA FOUND...");
			map.addAttribute("error", "There is No Suitable Matched Data Found");
			map.addAttribute("count", "0");
		}
		map.addAttribute("StbList", list);
		map.addAttribute("count", stbService.countSearch(user, stb, mso, brand, type, status));
		map.addAttribute("user", user);
		map.addAttribute("offset", offset);
		return new ModelAndView("TotalStock", map);

	}

	@ResponseBody
	@RequestMapping(value = "/deleteSTB", method = RequestMethod.GET)
	public String deleteSTB(ModelMap map, @RequestParam("user") String user, @RequestParam("stb_id") String stb_id,
			Integer offset, Integer maxResults) {

		String result = null;
		int i = stbService.delete(stb_id);
		if (i == 1) {
			result = "Setup Box Detail Remove Successfully";
		} else {
			result = "There may be some ERROR Please Try Again";
		}

		Gson gson = new Gson();
		String json = gson.toJson(result);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/warrantySTB", method = RequestMethod.GET)
	public String warrantySTB(ModelMap map, @RequestParam("user") String user, @RequestParam("stb_id") String stb_id,
			@RequestParam("warranty") String warranty, Integer offset, Integer maxResults) {
		System.out.println("user\t" + user + "\tstb_id\t" + stb_id + "\twarranty\t" + warranty);
		String result = null;

		int i = stbService.update(stb_id, warranty);
		if (i == 1) {
			result = "Setup Box Detail Remove Successfully";
		} else {
			result = "There may be some ERROR Please Try Again";
		}

		Gson gson = new Gson();
		String json = gson.toJson(result);

		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/bulkSheet", method = RequestMethod.POST)
	public ModelAndView processExcel(ModelMap model, @RequestParam("excelfile") MultipartFile excelfile,
			@RequestParam("user") String id) {
		try {
			AgentBillDetails cust = new AgentBillDetails();
			List pck = lmuserservice.getAllAgentNames(id);
			List paymentType = new ArrayList();
			paymentType.add("Cash");
			paymentType.add("Cheque");
			paymentType.add("Wallet");
			paymentType.add("Others");
			model.addAttribute("paymentType", paymentType);
			model.addAttribute("agentName", pck);
			model.addAttribute("bulkInfoForm", cust);

			BulkRechargeAmountList bulk = new BulkRechargeAmountList();
			List<BulkRechargeAmount> lstUser = new ArrayList<BulkRechargeAmount>();
			int i = 0;
			System.out.println("file not found name \t" + excelfile.getInputStream());
			// File file= new File();
			HSSFWorkbook workbook = new HSSFWorkbook(excelfile.getInputStream());
			String ss = excelfile.getName();
			HSSFSheet worksheet = workbook.getSheetAt(0);
			int noOfColumns = worksheet.getRow(0).getLastCellNum();
			System.out.println("Column count \t" + noOfColumns);
			if (noOfColumns == 8) {
				while (i <= worksheet.getLastRowNum()) {
					BulkRechargeAmount user = new BulkRechargeAmount();
					HSSFRow row = worksheet.getRow(i++);
					user.setInvoiceid(row.getCell(0).getStringCellValue());
					System.out.println("I am here 0\t " + row.getCell(0));

					user.setCustomerid((int) row.getCell(1).getNumericCellValue());
					System.out.println("I am here 0\t " + row.getCell(1));

					user.setCustomername(row.getCell(2).getStringCellValue());
					System.out.println("I am here 1 \t" + row.getCell(2));

					user.setCustomeraddress(row.getCell(3).getStringCellValue());
					System.out.println("I am here 2\t" + row.getCell(3));

					user.setCustomerpackagename(row.getCell(4).getStringCellValue());
					System.out.println("I am here 3 \t" + row.getCell(4));

					user.setCustomermobileno(row.getCell(5).getStringCellValue());
					System.out.println("I am here 4\t" + row.getCell(5));

					user.setCustomeremailid(row.getCell(6).getStringCellValue());
					System.out.println("I am here 5\t" + row.getCell(6));

					user.setCustomeramountofrecharge((float) row.getCell(7).getNumericCellValue());
					System.out.println("I am here 6\t" + row.getCell(7));
					lstUser.add(user);
				}
				model.addAttribute("persons", lstUser);
				bulk.setBulkInfo(lstUser);

				System.out.println("List Size: " + bulk.getBulkInfo().size());
				model.addAttribute("bulkData", bulk);
			} else {
				model.addAttribute("error", "File is Not Valid");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("user", id);
		return new ModelAndView("Topup", model);
	}

	@RequestMapping(value = "/stockfile", method = RequestMethod.POST)
	public ModelAndView stockfile(ModelMap model, @RequestParam("excelfile") MultipartFile excelfile,
			@RequestParam("user") String id) {
		try {

			BulkRechargeAmountList bulk = new BulkRechargeAmountList();
			List<BulkStock> lstUser = new ArrayList<BulkStock>();
			int i = 0;
			System.out.println("file not found name \t" + excelfile.getInputStream());
			// File file= new File();
			HSSFWorkbook workbook = new HSSFWorkbook(excelfile.getInputStream());
			String ss = excelfile.getName();
			HSSFSheet worksheet = workbook.getSheetAt(0);
			int noOfColumns = worksheet.getRow(0).getLastCellNum();
			System.out.println("Column count \t" + noOfColumns);
			if (noOfColumns == 3) {
				while (i <= worksheet.getLastRowNum()) {
					BulkStock userstock = new BulkStock();
					HSSFRow row = worksheet.getRow(i++);
					userstock.setBrand(row.getCell(0).getStringCellValue());
					System.out.println("I am here 0\t " + row.getCell(0));

					userstock.setMso(row.getCell(1).getStringCellValue());
					System.out.println("I am here 1\t " + row.getCell(1));
					userstock.setWarranty(row.getCell(2) + "");
					System.out.println("I am here 2 \t" + row.getCell(2));

					lstUser.add(userstock);
				}
				model.addAttribute("persons", lstUser);
				bulk.setBulkstock(lstUser);

				System.out.println("List Size: " + bulk.getBulkstock().size() + "\t userid=\t" + id);
				model.addAttribute("StockData", bulk);
			} else {
				model.addAttribute("error", "File is Not Valid");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("user", id);
		return new ModelAndView("AddNewStock", model);
	}

	@RequestMapping(value = "/uploadstockdata", method = RequestMethod.POST)
	public String uploadstockdata(@RequestParam("user") String user,
			@ModelAttribute("StockData") BulkRechargeAmountList bulk, ModelMap model) {
		System.out.println("uploadBulkTopup: " + user + ",sub: " + bulk);
		List<BulkStock> contacts = bulk.getBulkstock();
		System.out.println("Object List: " + contacts);
		if (null != contacts && contacts.size() > 0) {
			for (BulkStock contact : contacts) {
				STBStock sub = new STBStock();
				sub.setStb_Id(System.currentTimeMillis());
				sub.setBrand(contact.getBrand());
				sub.setLCO_Id(user);
				sub.setMSO(contact.getMso());
				sub.setTrndate_Of_MSO(getDate());
				sub.setSTB_Type("New");
				sub.setWarranty(contact.getWarranty() + "");
				sub.setSTB_Status("Off Line");
				sub.setSubscriberId("NA");
				sub.setSTB_Returned_trndate_Sub("NA");
				sub.setTrndate_Of_Subs("NA");
				int i = stbService.add(sub);

			}
			System.out.printf("Data Sucessfully Update \t ");
		} else {
			System.out.println("Data is NULL");
		}

		model.addAttribute("user", user);
		return "redirect:addStock.html";
	}

	@ResponseBody
	@RequestMapping(value = "/accountDetail", method = RequestMethod.GET)
	public String accountDetail(@RequestParam("user") String user, @RequestParam("invoice") String invoiceid,
			ModelMap model) {
		Gson gson = new Gson();
		String json = null;
		System.out.println("Invoice Details check data: " + invoiceid + "," + user);
		Customer_Invoice1 result = invoice1.getByInvoiceId(invoiceid);
		if (result != null) {
			json = gson.toJson(result);
			System.out.println("Result: " + result.getInvoice_No());
		} else
			json = gson.toJson("Data Not Found");

		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/allUsersData", method = RequestMethod.GET)
	public String allUsersData(@RequestParam("user") String user, @RequestParam("userid") String userid,
			ModelMap model) {
		Gson gson = new Gson();
		String json = null;
		System.out.println("+++++++++++++/////////----------------" + userid);
		Subscriber subdata = userService.getByID(userid);
		if (subdata != null) {
			json = gson.toJson(subdata);
			System.out.println("Result: " + subdata.getPassword());
		} else
			json = gson.toJson("Data Not Found");

		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/saveBulkByLCO", method = RequestMethod.GET)
	public ModelAndView saveBulkByLCO(@ModelAttribute("bulkInfoForm") AgentBillDetails sub, ModelMap map,
			@RequestParam("user") String user) {
		// System.out.println("AgentBillDetails Detail: "+sub.getCustId());
		// System.out.println("calling saveBulkByLCO: "+sub.getInvoice_id());
		Customer_Invoice1 tmpdata = invoice1.getByInvoiceId(sub.getInvoice_id());

		sub.setFromDate(tmpdata.getDueDate());
		sub.setToDate(tmpdata.getDueDate());
		sub.setCustId(tmpdata.getCustId());
		sub.setTotalAmt(tmpdata.getTotalAmt());
		sub.setInstatus("Aprroved");
		sub.setApprovedBy(user);
		sub.setApprovalDate(getDate());
		int i = agentbillservice.saveDetail(sub);

		Subscriber u = userService.getByID(tmpdata.getCustId());
		AllCollections col = new AllCollections();
		col.setInvoice(sub.getInvoice_id());
		col.setCust_Id(tmpdata.getCustId());
		// Doubt
		col.setCust_mobile(u.getMobile());
		col.setCust_Name(tmpdata.getCustName());
		col.setCurrent_Pckg(tmpdata.getCustBasePckg());
		col.setRecharge_Amount(tmpdata.getTotalAmt());
		col.setPaid_Amount(sub.getReceivedAmt());
		col.setDiscount(tmpdata.getTotalDues());
		col.setPayment_Mode("OffLine");
		col.setPayment_Status("Approved");
		col.setCollecting_Agent(sub.getAgentId());
		col.setLco_Id(user);
		col.setPayment_Type(sub.getPayment_Type());
		col.setApproval_ID(user);
		col.setRefernceId(sub.getReferenceId());
		col.setApproval_Date(getDate());
		col.setTrndate(getDate());
		col.setRemark(sub.getRemark());
		LCOCollectionRepository.saveDetail(col);
		int i2 = invoice1.updateInvoiceDetail(sub.getInvoice_id(), sub.getReceivedAmt(), sub.getAgentId(), getDate(),
				"Pending");
		map.addAttribute("user", user);
		return new ModelAndView("redirect:topUp.html", map);
	}

	@RequestMapping(value = "/uploadBulkTopup", method = RequestMethod.POST)
	public String uploadBulkTopup(@RequestParam("user") String user,
			@ModelAttribute("bulkData") BulkRechargeAmountList bulk, ModelMap model) {
		System.out.println("uploadBulkTopup: " + user + ",sub: " + bulk);
		List<BulkRechargeAmount> contacts = bulk.getBulkInfo();
		System.out.println("Object List: " + contacts);
		if (null != contacts && contacts.size() > 0) {
			for (BulkRechargeAmount contact : contacts) {
				Customer_Invoice1 tmpdata = invoice1.getByInvoiceId(contact.getInvoiceid() + "");
				if (tmpdata != null) {
					int i2 = invoice1.updateInvoiceDetail(contact.getInvoiceid() + "",
							contact.getCustomeramountofrecharge() + "", user, getDate(), "Approved");
					AgentBillDetails sub = new AgentBillDetails();
					sub.setInvoice_id(contact.getInvoiceid() + "");
					sub.setReceivedAmt(contact.getCustomeramountofrecharge() + "");
					sub.setAgentId(user);
					sub.setReferenceId("NA");
					sub.setRemark("NA");
					sub.setPayment_Type("NA");
					sub.setFromDate(tmpdata.getDueDate());
					sub.setToDate(tmpdata.getDueDate());
					sub.setCustId(tmpdata.getCustId());
					sub.setTotalAmt(tmpdata.getTotalAmt());
					sub.setInstatus("Aprroved");
					sub.setApprovedBy(user);
					sub.setApprovalDate(getDate());
					int i = agentbillservice.saveDetail(sub);

					Subscriber u = userService.getByID(tmpdata.getCustId());
					AllCollections col = new AllCollections();
					col.setInvoice(contact.getInvoiceid() + "");
					col.setCust_Id(tmpdata.getCustId());
					// Doubt Vcno
					col.setCust_mobile(u.getMobile());
					col.setCust_Name(tmpdata.getCustName());
					col.setCurrent_Pckg(tmpdata.getCustBasePckg());
					col.setRecharge_Amount(tmpdata.getTotalAmt());
					col.setPaid_Amount(contact.getCustomeramountofrecharge() + "");
					col.setDiscount(tmpdata.getTotalDues());
					col.setPayment_Mode("OffLine");
					col.setPayment_Status("Approved");
					col.setCollecting_Agent(user);
					col.setLco_Id(user);
					col.setPayment_Type("OffLine");
					col.setApproval_ID(user);
					col.setRefernceId("NA");
					col.setApproval_Date(getDate());
					col.setTrndate(getDate());
					col.setRemark("NA");
					LCOCollectionRepository.saveDetail(col);

					System.out.printf("Data in Loop%s \t ", contact.getCustomeremailid());
				} else {
					model.addAttribute("err", "error");
					break;

				}

			}
		} else {
			System.out.println("Data is NULL");
		}
		model.addAttribute("user", user);
		return "redirect:topUp.html";
	}

	// #######################################################################################
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

	String getSaltString() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 10) {
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;

	}

	/************* Image Upload **********/
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST)
	public @ResponseBody String upload(HttpSession session, HttpServletResponse response, Model model,
			@RequestParam("uploadimage") MultipartFile uploadimage, @RequestParam("user") String id) {
		String addpath = null;
		if (!uploadimage.isEmpty()) {
			System.out.println("******************** upload file ***************************");
			String path = session.getServletContext().getRealPath("/");
			String filename = uploadimage.getOriginalFilename();
			addpath = path + filename;
			imagename = filename;
			System.out.println(addpath);
			try {
				byte barr[] = uploadimage.getBytes();

				BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + "/" + filename));
				bout.write(barr);
				bout.flush();
				bout.close();

			} catch (Exception e) {
				System.out.println(e);
			}

		}
		model.addAttribute("addpath", addpath);
		return "";

	}

	@ResponseBody
	@RequestMapping(value = "/updatePckg", method = RequestMethod.GET)
	public String updatePckg(@RequestParam("user") String user, @RequestParam("pckg") String pckg,
			@RequestParam("price") String cost, @RequestParam("chnlist") String list) {
		String result = null;
		String channels[] = list.split(",");
		PackageInfo tmp = pckgservice.getByID(pckg);
		PackageInfo obj = new PackageInfo();
		obj.setLcoID(user);
		obj.setPckgType(tmp.getPckgType());
		obj.setNoOfUser(tmp.getNoOfUser());
		obj.setPrice(Long.parseLong(cost));
		obj.setTrnadte(getDate());
		obj.setPckgName(tmp.getPckgName());
		obj.setNoOfChannels(channels.length + "");
		obj.setPckgID(pckg);
		int i = pckgservice.editPckg(obj);
		int chk = 0;
		if (i == 1) {
			chk = pckgDetialservice.delete(pckg);
			for (int k = 0; k < channels.length; k++) {
				PackageDetail pd = new PackageDetail();
				pd.setPckg_Id(pckg + "");
				pd.setChannel_Name(channels[k]);
				pckgDetialservice.add(pd);
			}

		}
		if (i == 1 && chk == 1) {
			result = "Package Update Successfully";
		} else {
			result = "There may be some ERROR Please Try Again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		return json;

	}

	@ResponseBody
	@RequestMapping(value = "/getAddOnPckg", method = RequestMethod.GET)
	public String getAddOnPckg(@RequestParam("user") String user) {
		List<String> addon = pckgservice.getPckgByType(user, "Add On");
		for (String tmp : addon) {
			System.out.println("Add on Pckg: " + tmp);
		}
		Gson gson = new Gson();
		String json = gson.toJson(addon);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/getALCarte", method = RequestMethod.GET)
	public String getALCarte(@RequestParam("user") String user) {
		List<String> al = pckgservice.getPckgByType(user, "A-La-Carte");
		for (String tmp : al) {
			System.out.println("A la Carte Pckg: " + tmp);
		}
		Gson gson = new Gson();
		String json = gson.toJson(al);

		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/addSubscriber", method = RequestMethod.POST)
	public ModelAndView addSubscriber(ModelMap map, @RequestParam("user") String user,
			@ModelAttribute("NewSubscriber") Subscriber sub, @RequestParam("addpckg") String adonList,
			@RequestParam("allpckg") String alList) {
		System.out.println("adonList List Of Package---------\t" + adonList);
		sub.setUserName(System.currentTimeMillis());
		sub.setPassword(getSaltString());
		sub.setLcoId(user);
		sub.setTrndate(getDate());
		sub.setAccountBalance("0");
		sub.setSTB_IssuedOn(getDate());
		sub.setReturnSTB("NA");
		sub.setStandBySTBIssued("NA");
		sub.setSubStatus("Live");
		sub.setAddOnPCKG(adonList);
		sub.setA_La_Carte(alList);
		int i = userService.addSubscriber(sub);
		map.addAttribute("user", user);
		return new ModelAndView("redirect:newConnn.html", map);
	}

	@ResponseBody
	@RequestMapping(value = "/getTotalCostForMulti", method = RequestMethod.GET)
	public String getTotalCost(@RequestParam("user") String user, @RequestParam("cost") String cost,
			@RequestParam("name") String name) {
		System.out.println("calling getTotalCostForMulti: " + name + "," + cost);
		int tmpCost = 0;
		if (cost.equalsIgnoreCase("NA")) {
			tmpCost = 0;
		} else {
			tmpCost = Integer.parseInt(cost);
		}
		long i = pckgservice.getCostByName(name);
		i = i + tmpCost;
		Gson gson = new Gson();
		String json = gson.toJson(i);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/getTotalCostForBase", method = RequestMethod.GET)
	public String getTotalCostForBase(@RequestParam("user") String user, @RequestParam("name") String name) {

		long i = pckgservice.getCostByName(name);
		Gson gson = new Gson();
		String json = gson.toJson(i);

		return json;
		// return new ModelAndView(json);
	}

	@ResponseBody
	@RequestMapping(value = "/getReduceCostForMulti", method = RequestMethod.GET)
	public String getReduceCostForMulti(@RequestParam("user") String user, @RequestParam("cost") String cost,
			@RequestParam("name") String name) {
		System.out.println("calling getTotalCostForMulti: " + name + "," + cost);
		int tmpCost = 0;
		if (cost.equalsIgnoreCase("NA")) {
			tmpCost = 0;
		} else {
			tmpCost = Integer.parseInt(cost);
		}
		long i = pckgservice.getCostByName(name);
		i = tmpCost - i;
		Gson gson = new Gson();
		String json = gson.toJson(i);

		return json;
		// return new ModelAndView(json);
	}

	// ################################################################### Bill
	// Generate #####################################################

	@RequestMapping(value = "/billCreate", method = RequestMethod.GET)
	public ModelAndView billCreate(@RequestParam("user") String user, ModelMap model) {

		String result = null;
		int i = createBill(user);
		if (i > 0) {
			result = "Bill Generate Successfully";
		} else {
			result = "There is some ERROR Please Try Again";
		}
		Gson gson = new Gson();
		String json = gson.toJson(result);
		model.addAttribute("user", user);
		return new ModelAndView("redirect:LCOHome.html");
	}

	public int createBill(String user) {
		int data = 0;
		List<Subscriber> l = userService.getAll(user);
		for (int i = 0; i < l.size(); i++) {
			Subscriber sub = l.get(i);

			double primaryAmt = 0l;
			String totalAmt = null;
			String openingBal = null;
			String lastPaid = null;
			String totalDues = null;
			String billAfterDueDate = null;
			String sDate = null;
			String actCharges = null;
			String stbRental = null;
			String digiCharges = null;
			String fta = null;
			int totChn = 0;
			Customer_Invoice1 lastData = invoice1.getLastPaymentDetail(sub.getUserName() + "");
			if (lastData != null) {
				sDate = lastData.geteDate();
				actCharges = "0";
				lastPaid = lastData.getBillAmtPaid();
				openingBal = lastData.getBillAfterDueDate();
			} else {
				sDate = sub.getTrndate();
				actCharges = sub.getActivationCharge();
				lastPaid = "0";
				openingBal = "0";

			}
			// Interval & Primary Price
			System.out.println("FDate: " + sDate + ",EDate: " + getDate());
			long interval = dayCalculate(sDate, getDate());
			System.out.println("Interval: " + interval);
			if (interval == 0) {
				interval = 1;
			}
			double pckgPrice = Long.parseLong(sub.getPCKGPrice()) / interval;
			primaryAmt = interval * pckgPrice;

			// set Activation charges & Rentals & FTA
			stbRental = sub.getSTB_Monthly_Rental();
			String BaseChn = sub.getBasePCKG();
			int tmpBase = Integer.parseInt(pckgservice.getNoOfChn(BaseChn));

			String addChn = sub.getAddOnPCKG();
			String tmpaddChn[] = addChn.split(",");
			int tmpadd = 0;
			for (int j = 0; j < tmpaddChn.length; j++) {
				tmpadd = tmpadd + Integer.parseInt(pckgservice.getNoOfChn(tmpaddChn[j]));
			}

			String allChn = sub.getA_La_Carte();
			String tmpallChn[] = addChn.split(",");
			int tmpall = 0;
			for (int j = 0; j < tmpaddChn.length; j++) {
				tmpall = tmpall + Integer.parseInt(pckgservice.getNoOfChn(tmpallChn[j]));
			}
			totChn = tmpBase + tmpadd + tmpall;
			fta = channelService.countFTA(user) + "";

			// set Packages Price
			long baseCost = pckgservice.getCostByName(sub.getBasePCKG());
			String addpckg = sub.getAddOnPCKG();
			String tmpaddpckg[] = addpckg.split(",");
			long addCost = 0l;
			for (int pc = 0; pc < tmpaddpckg.length; pc++) {
				addCost = addCost + pckgservice.getCostByName(tmpaddpckg[pc]);
			}
			String allpckg = sub.getAddOnPCKG();
			String tmpallpckg[] = allpckg.split(",");
			long allCost = 0l;
			for (int al = 0; al < tmpallpckg.length; al++) {
				allCost = allCost + pckgservice.getCostByName(tmpallpckg[al]);
			}

			System.out.println("All Pckg Cost: " + baseCost + "," + addCost + "," + allCost);

			// set taxs & LateDate
			Customer_Invoice1 cst = new Customer_Invoice1();
			String id = "IN" + sub.getMobile() + "_" + System.currentTimeMillis();
			LCO_Setting ls = settingService.getByID(user);
			String dueDate = ls.getLateDate();

			double st_tmp = (primaryAmt * Float.parseFloat(ls.getService_tax())) / 100;
			double cess_tmp = (primaryAmt * Float.parseFloat(ls.getCess())) / 100;
			double amst_tmp = (primaryAmt * Float.parseFloat(ls.getEnt_tax())) / 100;
			String st = String.format("%.2f", st_tmp);
			String cess = String.format("%.2f", cess_tmp);
			String amst = String.format("%.2f", amst_tmp);

			// set Paid amounts
			System.out.println("Total Channels: " + totChn + ",Amount: " + calculateDigitalCharges(totChn));
			double digi = Double.parseDouble(calculateDigitalCharges(totChn));
			long stbRen = Long.parseLong(stbRental);
			long activation = Long.parseLong(actCharges);
			System.out.println("all Values: "+primaryAmt+","+st_tmp+","+cess_tmp+","+amst_tmp+","+baseCost+
					","+addCost+","+allCost+","+digi+","+stbRen+","+activation);
			double tot = primaryAmt + st_tmp + cess_tmp + amst_tmp + baseCost + addCost + allCost + digi + stbRen
					+ activation;
			System.out.println("tot===== Bill included tax: " + tot);

			totalAmt = String.format("%.2f", tot);
			System.out.println("Total Bill included tax: " + totalAmt);

			double paidAmt = getPaidAmt(tot, Double.parseDouble(openingBal), Double.parseDouble(lastPaid));
			totalDues = String.format("%.2f", paidAmt);

			double payAfter = paidAmt + Long.parseLong(ls.getLateFeeCharges());
			billAfterDueDate = String.format("%.2f", payAfter);

			// Set Invoice Details//
			cst.setInvoice_No(id);
			cst.setCustId(sub.getUserName() + "");
			cst.setCustName(sub.getFirstName() + " " + sub.getLastName());
			cst.setCustMobile(sub.getMobile());
			cst.setCustAdd(sub.getAddress());
			cst.setCustBasePckg(baseCost + "");
			cst.setCustAddPckg(addCost + "");
			cst.setCustALPckg(allCost + "");
			cst.setCustPckgCost(sub.getPCKGPrice());
			cst.setsDate(sDate);
			cst.seteDate(getDate());
			cst.setActivationCharges(actCharges);
			cst.setStbMonthlyRental(stbRental);
			cst.setDigitalCapacityRental(calculateDigitalCharges(totChn));
			cst.setFta(fta);
			cst.setDueDate(getDate());
			cst.setServiceTax(st);
			cst.setCess(cess);
			cst.setAmusementTax(amst);
			cst.setTotalAmt(totalAmt);

			cst.setOpeningBal(openingBal);
			cst.setLastPaid(lastPaid);

			cst.setCurrentBill(totalAmt);
			cst.setTotalDues(totalDues);
			cst.setDueDate(getDueDate(dueDate));
			cst.setBillAfterDueDate(billAfterDueDate);
			cst.setTrndate(getDate());
			cst.setBillAmtPaid("NA");
			cst.setBillStatus("Not Paid");
			cst.setDateOfPaid("NA");
			cst.setAgentId("NA");
			cst.setLcoId(user);

			invoice1.save(cst);

		}
		return data;
	}

	// ######################################################### Interval of
	// Days ########################################
	public long dayCalculate(String fdate, String edate) {
		long diff = 0;
		// System.out.println("Dates: "+fdate+","+edate);
		try {
			SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date1 = myFormat.parse(fdate);
			Date date2 = myFormat.parse(edate);
			diff = date2.getTime() - date1.getTime();
			diff = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			// System.out.println("interval: "+diff);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return diff;

	}

	public String getDueDate(String due) {
		String data = null;
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 16);
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			String formatted = format1.format(cal.getTime());
			data = formatted;
			// Output "2012-09-26"

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return data;
	}

	public String calculateDigitalCharges(int noOfChn) {
		String data = null;
		double tmp = 0;
		if (noOfChn <= 100) {
			data = "130";
		} else {
			int med = noOfChn - 100;
			double medAvg = med / 25;
			double mod = med % 25;
			if (mod != 0) {
				tmp = ((medAvg + 1) * 20) + 130;
			} else {
				tmp = (medAvg * 20) + 130;
			}
			data = tmp + "";
		}

		return data;
	}

	public Double getPaidAmt(double primary, double openBal, double lastPaid) {
		double data = 0l;
		double advance = openBal - lastPaid;
		if (advance < 0) {
			data = primary + advance;
		} else {
			data = primary - advance;
		}
		return data;
	}

}