package com.user.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.user.repository.User;
import com.user.service.MyService;

@Controller
public class MyController {

	@Autowired
	MyService service;

	@GetMapping("loadHomePage")
	public ModelAndView loadHomePage() {
		return service.loadHomePage();
	}

	@GetMapping("loadRegisterUserForm")
	public ModelAndView loadRegisterForm() {
		return service.loadRegisterForm();
	}

	@PostMapping("saveUser")
	public ModelAndView saveUser(@ModelAttribute User user, @RequestParam String date, @RequestParam String password1) {
		return service.saveUser(user, date, password1);
	}

	@GetMapping("loadUserLoginPage")
	public ModelAndView loadUserLoginPage() {
		return service.loadUserLoginPage();
	}

	@PostMapping("loadUserMainPage")
	public ModelAndView loadMainPage(@RequestParam int userId, @RequestParam String password, HttpSession session) {
		return service.loadMainPage(userId, password, session);
	}

	@GetMapping("loadUserMainPageOnCancel")
	public ModelAndView loadUserMainPageOnCancel(HttpSession session) {
		return service.loadUserMainPageOnCancel(session);
	}

	@GetMapping("loadResetPasswordPage")
	public ModelAndView loadResetPasswordPage() {
		return service.loadResetPasswordPage();
	}

	@PostMapping("loadResetPasswordFinalPage")
	public ModelAndView loadResetPasswordFinalPage(@RequestParam int userId, @RequestParam long phoneNo,
			HttpSession session) {
		return service.loadResetPasswordFinalPage(userId, phoneNo, session);
	}

	@PostMapping("createNewPassword")
	public ModelAndView createNewPassword(@RequestParam String password1, HttpSession session) {
		return service.createNewPassword(session, password1);
	}

	@GetMapping("loadAddMoneyPage")
	public ModelAndView loadAddMoneyPage() {
		return service.loadAddMoneyPage();
	}

	@PostMapping("addMoney")
	public ModelAndView addMoney(@RequestParam double inr, HttpSession session) {
		return service.addMoney(inr, session);
	}

	@GetMapping("logoutUser")
	public ModelAndView logoutUser(HttpSession session) {
		return service.logoutUser(session);
	}

	@GetMapping("logoutAdmin")
	public ModelAndView logoutAdmin() {
		return service.logoutAdmin();
	}

	@GetMapping("loadViewAllTrainBookingPage")
	public ModelAndView loadViewAllTrainBookingPage() {
		return service.loadViewAllTrainBookingPage();
	}

	@GetMapping("loadBookTrainForm")
	public ModelAndView loadBookTrainForm(@RequestParam int id, HttpSession session) {
		return service.loadBookTrainForm(id, session);
	}
}
