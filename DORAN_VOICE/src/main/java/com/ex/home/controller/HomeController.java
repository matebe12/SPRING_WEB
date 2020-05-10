package com.ex.home.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	String path = "";

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {

		logger.info("home");

		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) throws Exception {

		logger.info("main");
		
		return "main";
	}
	
	
	@RequestMapping(value = "/backPage", method = RequestMethod.GET)
	public String back(HttpServletRequest request) {
		String backpage = "individual";
		return "redirect:/" + backpage;
	}


	@RequestMapping(value = "/teamuploadAjaxAction")
	public @ResponseBody void uploadAjaxAction(MultipartFile[] uploadFile, HttpSession session) {

		String uploadFolder = "C:\\upload";
		String uploadFileName = "";
		UUID uuid = UUID.randomUUID();

		for (MultipartFile multipartFile : uploadFile) {

			uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			System.out.println("only file name : " + uploadFileName);
			File saveFile = new File(uploadFolder, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}

		path = uploadFileName;

		System.out.println(path);

	}

	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String Introduce() {

		return "introduce";
	}

}
