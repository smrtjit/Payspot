
package com.dialnet.source.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import com.dialnet.source.model.AllCollections;
import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.BulkRechargeAmount;
import com.dialnet.source.model.BulkRechargeAmountList;
import com.dialnet.source.model.Customer_Invoice1;
import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.LMUser;
import com.dialnet.source.model.Subscriber;
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
@SessionAttributes("lmlogin")
public class LMController {

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

	@RequestMapping(value = "/lmlogin", method = RequestMethod.GET)
	public String login(Model model) {
		UserLogin studentLogin = new UserLogin();
		model.addAttribute("lmlogin", studentLogin);
		return "lmlogin";
	}

	@RequestMapping(value = "/lmlogin", method = RequestMethod.POST)
	public ModelAndView login(@Valid @ModelAttribute("lcoLogin") UserLogin studentLogin, BindingResult result,
			ModelMap map, RedirectAttributes redir) {
		if (result.hasErrors()) {
			// return "lcologin";
			return new ModelAndView("lmlogin", "error", "There is some Errors");

		} else {
			boolean found = lmuserservice.findByLogin(studentLogin.getUserName(), studentLogin.getPassword());
			String user = studentLogin.getUserName();
			if (found) {
				ModelAndView modelAndView = new ModelAndView();
				modelAndView.setViewName("redirect:LMDashboard.html?user=" + user);
				return modelAndView;
				// map.addAttribute("userList", userList);
				// map.addAttribute("user", user);
				// return new ModelAndView("Dashboard", map);
				// return new ModelAndView("redirect:Dashboard.jsp", "user",
				// user);
			} else {
				// model.addAttribute("message", "You have been logged out
				// successfully.");
				// return "lcologin";
				return new ModelAndView("lmlogin", "error", "Invalid Username or Password!!!");
			}
		}

	}

	@RequestMapping(value = "/LMDashboard", method = RequestMethod.GET)
	public ModelAndView allLCOComplain(ModelMap map, @RequestParam("user") String user) {

		map.addAttribute("user", user);
		return new ModelAndView("LMHome", map);
	}

	@RequestMapping(value = "/addComplaintLm", method = RequestMethod.GET)
	public ModelAndView addComplaintLm(ModelMap map, @RequestParam("user") String user) {

		map.addAttribute("user", user);
		return new ModelAndView("AddComplaintLM", map);
	}

	@RequestMapping(value = "/LMnewConnn", method = RequestMethod.GET)
	public String newConnn(ModelMap map, @RequestParam("user") String user) {
		Subscriber sub = new Subscriber();
		map.addAttribute("NewSubscriber", sub);
		List<String> basic = pckgservice.getPckgByType(lmuserservice.getLCOID(user), "Basic");
		map.addAttribute("BASIC", basic);

		List<String> stb = stbService.getAllAvlSTB(lmuserservice.getLCOID(user));
		map.addAttribute("STB", stb);
		map.addAttribute("user", user);
		return "LMCreateNewCon";
	}

	@RequestMapping(value = "/addSubscriberLM", method = RequestMethod.POST)
	public ModelAndView addSubscriber(ModelMap map, @RequestParam("user") String user,
			@ModelAttribute("NewSubscriber") Subscriber sub, @RequestParam("addpckg") String adonList,
			@RequestParam("allpckg") String alList) {
		System.out.println("adonList List Of Package---------\t" + adonList);
		sub.setUserName(System.currentTimeMillis());
		sub.setPassword(getSaltString());
		sub.setLcoId(lmuserservice.getLCOID(user));
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
		return new ModelAndView("redirect:LMCreateNewCon.html", map);
	}

	@ResponseBody
	@RequestMapping(value = "/findbycusId", method = RequestMethod.GET)
	public String findbycusId(@RequestParam("user") String user, Model model, @RequestParam("cust_id") String cust_id) {
		System.out.println("\n**************** Find Value **********************\t" + cust_id);
		Subscriber tmp1 = userService.getByID(cust_id);

		Gson gson = new Gson();
		String json = gson.toJson(tmp1);
		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}
	
	@RequestMapping(value = "/excelbulkSheet", method = RequestMethod.POST)
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
		return new ModelAndView("LMTopup", model);
	}

	

	@RequestMapping(value = "/saveBulkTopup", method = RequestMethod.POST)
	public String uploadBulkTopup(@RequestParam("user") String user,
			@ModelAttribute("bulkData") BulkRechargeAmountList bulk, ModelMap model) {
		System.out.println("save ulkTopup: " + user + ",sub: " + bulk);
		List<BulkRechargeAmount> contacts = bulk.getBulkInfo();
		System.out.println("Object List: " + contacts);
		if (null != contacts && contacts.size() > 0) {
			for (BulkRechargeAmount contact : contacts) {
				Customer_Invoice1 tmpdata = invoice1.getByInvoiceId(contact.getInvoiceid() + "");
				if (tmpdata != null) {
					int i2 = invoice1.updateInvoiceDetail(contact.getInvoiceid() + "",
							contact.getCustomeramountofrecharge() + "", user, getDate(), "Pending");
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
					sub.setInstatus("Pending");
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
					col.setPayment_Status("Pending");
					col.setCollecting_Agent(user);
					col.setLco_Id(lmuserservice.getLCOID(user));
					col.setPayment_Type("OffLine");
					col.setApproval_ID(user);
					col.setRefernceId("NA");
					col.setApproval_Date(getDate());
					col.setTrndate(getDate());
					col.setRemark("NA");
					LCOCollectionRepository.saveDetail(col);

					System.out.printf("Data Sucessfully Update------------%s \t ", contact.getCustomeremailid());
				} else {
					model.addAttribute("err", "error");
					break;

				}

			}
		} else {
			System.out.println("Data is NULL");
		}
		model.addAttribute("user", user);
		return "redirect:lmtopUp.html";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findByMobile", method = RequestMethod.GET)
	public String findByMobile(@RequestParam("user") String user, Model model, @RequestParam("mobile") String mobile) {
		System.out.println("\n**************** Find Value **********************\t" + mobile);
		Subscriber tmp1 = userService.getByMobile(mobile);

		Gson gson = new Gson();
		String json = gson.toJson(tmp1);
		model.addAttribute("user", user);
		return json;
		// return new ModelAndView(json);
	}

	@RequestMapping(value = "/addnewcomplaintbylm", method = RequestMethod.GET)
	public ModelAndView addNewComplaintLCO(ModelMap map, @RequestParam("user") String user,
			@RequestParam("mobile") String mobile, @RequestParam("cust_id") String cust_id,
			@RequestParam("type") String type, @RequestParam("report") String report) {
		System.out.println("user: " + user + "," + "mobile: " + mobile + "," + "vc: " + cust_id + "," + "type: " + type
				+ "," + "report: " + report);
		String main = null;
		Subscriber sub = null;

		if (mobile.equals("") || mobile == null) {
			main = cust_id;
			sub = userService.getByID(cust_id);
		} else {
			main = mobile;
			sub = userService.getByMobile(mobile);
		}
		AllComplaints mainObj = new AllComplaints();
		System.out.println("Sub Object: " + sub);
		if (sub == null) {
			map.addAttribute("error", "Mobile Number or VC Number is not Valid");
		} else {
			mainObj.setComplaint_type(type);
			mainObj.setComplaint_status("Open");
			mainObj.setCustomer_caf(sub.getCRFNo());
			mainObj.setCustomer_name(sub.getFirstName());
			mainObj.setCustomer_add(sub.getAddress());
			mainObj.setCustomer_mobile(sub.getMobile());
			mainObj.setCust_remark(report);
			mainObj.setOpen_date(getDate());
			mainObj.setClosing_remark("NA");
			mainObj.setClosing_date("NA");
			mainObj.setCreater_Id(user);
			mainObj.setLco_id(user);
			mainObj.setComplaint_no(System.currentTimeMillis());
			comservice.add(mainObj);
		}
		map.addAttribute("user", user);
		return new ModelAndView("redirect:addComplaintLm.html", map);

	}

	@RequestMapping(value = "/saveBulkByLM", method = RequestMethod.GET)
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

	@ResponseBody
	@RequestMapping(value = "/invoiceDetail", method = RequestMethod.GET)
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

	@RequestMapping(value = "/LMallComp", method = RequestMethod.GET)
	public ModelAndView allComplaint(ModelMap map, @RequestParam("user") String user, Integer offset,
			Integer maxResults) {
		List al = comservice.list(lmuserservice.getLCOID(user), offset, maxResults);
		map.addAttribute("userList", al);
		map.addAttribute("count", comservice.count(lmuserservice.getLCOID(user)));
		map.addAttribute("user", user);
		return new ModelAndView("LMAllComplaint", map);
	}

	@RequestMapping(value = "/searchComplaintLM", method = RequestMethod.GET)
	public ModelAndView searchComplaint(ModelMap map, @RequestParam("user") String user,
			@RequestParam("VC_No") String VC_No, @RequestParam("fdate") String fdate,
			@RequestParam("edate") String edate, @RequestParam("mobile") String mobile,
			@RequestParam("status") String status, Integer offset, Integer maxResults) {
		map.addAttribute("user", user);
		System.out.println("VC no: " + VC_No + "user: " + user);
		List<AllComplaints> tmp = comservice.listForSearch(lmuserservice.getLCOID(user), fdate, edate, VC_No, mobile,
				status, offset, maxResults);

		System.out.println("tmp.size()***************: " + tmp.size());
		if (tmp.size() < 1) {
			map.addAttribute("error", "No Data Found!!!");
			map.addAttribute("count", "0");
			map.addAttribute("offset", offset);
			System.out.println("No Data Found........................");
		} else {
			map.addAttribute("userList", tmp);
			map.addAttribute("count",
					comservice.countForSearch(lmuserservice.getLCOID(user), fdate, edate, VC_No, mobile, status));
			map.addAttribute("offset", offset);
		}

		return new ModelAndView("LMAllComplaint", map);
	}

	@RequestMapping(value = "/lmtopUp", method = RequestMethod.GET)
	public ModelAndView topUp(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {
		List<BulkRechargeAmount> lstUser = new ArrayList<BulkRechargeAmount>();
		AgentBillDetails cust = new AgentBillDetails();
		List pck = lmuserservice.getAllAgentNames(lmuserservice.getLCOID(user));
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
		return new ModelAndView("LMTopup", map);
	}

	@RequestMapping(value = "/lmDetail", method = RequestMethod.GET)
	public String lcoProfile(ModelMap map, @RequestParam("user") String user, Integer offset, Integer maxResults) {

		map.addAttribute("user", user);
		LMUser lco = lmuserservice.get(user);
		map.addAttribute("LMDetail", lco);
		return "LMProfile";
	}

	// ########################################################Date & Password
	// Functions
	// ######################################################################
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
}
