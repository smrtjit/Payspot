

package com.dialnet.source.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dialnet.source.model.AllComplaints;
import com.dialnet.source.model.LMUser;
import com.dialnet.source.model.User;
import com.dialnet.source.model.UserLogin;
import com.dialnet.source.service.AllComplaintService;
import com.dialnet.source.service.LMUserService;
import com.dialnet.source.service.SubscriberService;

@Controller
@SessionAttributes("lmlogin")
public class LMController {
	
	@Autowired
	public LMUserService userService;
	
	@Autowired
	public AllComplaintService LCOComplaintRepository;
	
	@Autowired
	public SubscriberService subService;
	/*
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(Model model) {
		User student = new User();		
		model.addAttribute("student", student);		
		return "signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signup(@Valid @ModelAttribute("student") User student, BindingResult result, Model model) {		
		if(result.hasErrors()) {
			return "signup";
		} else if(studentService.findByUserName(student.getUserName())) {
			model.addAttribute("message", "User Name exists. Try another user name");
			return "signup";
		} else {
			studentService.save(student);
			model.addAttribute("message", "Saved student details");
			return "redirect:login.html";
		}
	}
	*/
	@RequestMapping(value="/lmlogin", method=RequestMethod.GET)
	public String login(Model model) {			
		UserLogin studentLogin = new UserLogin();		
		model.addAttribute("lmlogin", studentLogin);
		return "lmlogin";
	}
	
	@RequestMapping(value="/lmlogin", method=RequestMethod.POST)
	public ModelAndView login(@Valid @ModelAttribute("lcoLogin") UserLogin studentLogin, BindingResult result,ModelMap map, RedirectAttributes redir) {
		if (result.hasErrors()) {
			//return "lcologin";
			return new ModelAndView("lcologin", "error", "There is some Errors");
			
		} else {
			boolean found = userService.findByLogin(studentLogin.getUserName(), studentLogin.getPassword());
			String user=studentLogin.getUserName();
			if (found) {
				ModelAndView modelAndView=new ModelAndView();
				modelAndView.setViewName("redirect:allLMComplain.html?user="+user);
			    return modelAndView;
				//map.addAttribute("userList", userList);
		       // map.addAttribute("user", user);
		        //return new ModelAndView("Dashboard", map);
				//return new ModelAndView("redirect:Dashboard.jsp", "user", user);
			} else {	
				//model.addAttribute("message", "You have been logged out successfully.");
				//return "lcologin";
				return new ModelAndView("lcologin", "error", "Invalid Username or Password!!!");
			}
		}
		
	}
	
	 @RequestMapping(value="/allLMComplain", method=RequestMethod.GET)
		public ModelAndView allLCOComplain(ModelMap map,@RequestParam("user") String user) {
		 List<AllComplaints> userList = LCOComplaintRepository.getAllComplaints();
				for (AllComplaints temp : userList) {
					System.out.println("User Name: "+temp.getComplaint_no()+",Mobile No.: "+temp.getCustomer_vcno());
					
				}
				
				map.addAttribute("userList", userList);
		        map.addAttribute("user", user);
		        return new ModelAndView("LMDashboard", map);
			
			
		}
	 
	 @RequestMapping(value="/lmConnection", method=RequestMethod.GET)
		public ModelAndView lmConnection(ModelMap map,@RequestParam("user") String user) {
		map.addAttribute("user", user);
		        return new ModelAndView("LMConnection", map);
			
			
		}
	 
	 
	 @RequestMapping(value="/lmAccount", method=RequestMethod.GET)
		public ModelAndView lmAccount(@RequestParam("user") String user, ModelMap map) {
					LMUser found=userService.get(user);
					System.out.println("EmailId:"+ found.getPermanent_add());
			
					ModelAndView model=new ModelAndView("LMMyAccount");
					//model.setViewName("redirect:LMMyAccount.html?user="+user);
					model.addObject("user", user);
					model.addObject("Designation", found.getDesignation());
					model.addObject("Name", found.getName());
					model.addObject("EmailId", found.getEmail_id());
					model.addObject("Mobile", found.getMobile());
					model.addObject("LandLine", found.getLandline_no());
					model.addObject("corres_add", found.getCorres_add());
					model.addObject("ID", found.getIdentity_proof());
					model.addObject("Per_add", found.getPermanent_add());
					model.addObject("Add_id", found.getAdd_proof());
				    return model;
		}
	 
	 @RequestMapping(value="/topupPage", method=RequestMethod.GET)
		public String topupPage(@RequestParam("user") String user,Model model) {			
			model.addAttribute("user", user);
			return "LMTopup";
		}
	 
	 @RequestMapping(value="/accountMgmt", method=RequestMethod.GET)
		public String accountMgmt(@RequestParam("user") String user,Model model) {			
			model.addAttribute("user", user);
			return "LMAccountMgmt";
		}
	 
	 @RequestMapping(value="/singleLMTopUp", method=RequestMethod.GET)
		public String singleLMTopUp(@RequestParam("user") String user,@RequestParam("VC_No") String VC_No,Model model) {	
		 System.out.println("VC_No: "+VC_No);
		 User usr=subService.findByVCNO(VC_No);
		 if(usr!=null){
			 //model.addAttribute("user", user);
			 System.out.println("Name: "+usr.getCustomer_name());
		 }
		 return "LMTopup";
		}
	
	/*
	@RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session ) {
       session.invalidate();
       return "logout";
    }
	*/
	
}
