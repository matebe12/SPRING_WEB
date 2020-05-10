package com.ex.home.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ex.service.User.UserService;
import com.ex.util.Email;
import com.ex.util.EmailSender;
import com.ex.util.Security;

@Controller
@RequestMapping(value = "/user", method = RequestMethod.GET)
public class UserContorller {

	private static final Logger logger = LoggerFactory.getLogger(UserContorller.class);
	
	@Autowired
	private UserService service;
	
	@Autowired
	private Email mail;
	
	@Autowired
	private EmailSender emailSender;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void Login() {
		logger.debug("USER_LOGIN PAGE");
	}

	@RequestMapping(value= "/regist", method = RequestMethod.GET)
	public void Regist() {
		logger.debug("USER_REGIST PAGE");
	}
	
	@RequestMapping("/forgotPw")
	public void ForgotPw() {
		logger.debug("FORGOT_PW PAGE");
	}

	@ResponseBody
	@RequestMapping(value="/login_try", method= RequestMethod.POST)
	public Map<String,Object> Login(@RequestBody Map<String,Object> User, HttpSession  session){
		logger.debug(User.toString());
		User.put("USER_PW", Security.encSHA256((String)User.get("USER_PW")));
		Map<String,Object> resultMap = service.getUser(User);
		session.setAttribute("user", resultMap);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value="/sign_up", method= RequestMethod.POST)
	public Map<String,Object> signUp(@RequestBody Map<String,Object> User){
		logger.debug(User.toString());
		User.put("USER_PW", Security.encSHA256((String)User.get("USER_PW")));
		return service.insertUser(User);
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method= RequestMethod.POST)
	public Map<String,Object> idCheck(@RequestBody Map<String,Object> User){
		logger.debug(User.toString());
		return service.getUserId(User);
	}
	
}
