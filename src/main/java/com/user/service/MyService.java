package com.user.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.train.repository.TrainRepository;
import com.user.repository.MyRepository;
import com.user.repository.User;

@Service
public class MyService {

	@Autowired
	MyRepository repository;
	
	@Autowired
	TrainRepository trainRepository;

	public ModelAndView loadRegisterForm() {
		return new ModelAndView("RegisterForm");
	}

	public ModelAndView loadUserLoginPage() {
		return new ModelAndView("UserLogin");
	}

	public ModelAndView loadResetPasswordPage() {
		return new ModelAndView("ResetPassword");
	}

	public ModelAndView saveUser(User user, String date, String password) {
		ModelAndView andView = new ModelAndView("HomePage");
		user.setPassword(password);
		user.setDob(Date.valueOf(date));
		Date dob = Date.valueOf(date);
		int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		user.setAge(age);
		if (age < 18) {
			andView.addObject("alert", "Sorry, you are not eligible");
		} else {
			repository.saveNewUser(user);
			andView.addObject("message", "Profile created successfully");
		}
		return andView;
	}

	public ModelAndView loadMainPage(int userId, String password, HttpSession session) {
		ModelAndView andView = new ModelAndView();
		User user = repository.getUserById(userId);
		if (user == null) {
			andView.setViewName("UserLogin");
			andView.addObject("alert", "no records found on the id");
		} else {
			if (user.getPassword().equals(password)) {
				andView.setViewName("UserMainPage");
				andView.addObject("user",user);
				session.setAttribute("user", user);
			} else {
				andView.setViewName("UserLogin");
				andView.addObject("alert", "incorrect password");
			}
		}
		return andView;
	}

	public ModelAndView loadResetPasswordFinalPage(int userId, long phoneNo, HttpSession session) {
		ModelAndView andView = new ModelAndView();
		User user = repository.getUserById(userId);
		if (user == null) {
			andView.setViewName("ResetPassword");
			andView.addObject("alert", "enter the valid id");
		} else {
			if (user.getPhoneNo() == phoneNo) {
				andView.setViewName("ResetPasswordFinal");
				session.setAttribute("myObj", user);
			} else {
				andView.setViewName("ResetPassword");
				andView.addObject("alert", "incorrect phone number");
			}
		}
		return andView;
	}

	public ModelAndView createNewPassword(HttpSession session, String password) {
		User user = (User) session.getAttribute("myObj");
		user.setPassword(password);
		repository.updateUser(user);
		ModelAndView andView = new ModelAndView("UserLogin");
		session.removeAttribute("myObj");
		andView.addObject("alert", "password changed successfully");
		return andView;
	}

	
	public ModelAndView loadAddMoneyPage() {
		ModelAndView andView=new ModelAndView("AddMoney");
		return andView;
	}

	public ModelAndView addMoney(double inr, HttpSession session) {
		ModelAndView andView=new ModelAndView("UserMainPage");
		User user=(User)session.getAttribute("user");
		user.setInr(user.getInr()+inr);
		repository.updateUser(user);
		andView.addObject("user",user);
		return andView;
		
	}

	public ModelAndView logoutUser(HttpSession session) {
		ModelAndView andView=new ModelAndView("HomePage");
		session.removeAttribute("user");
		return andView;
	}

	public ModelAndView loadViewAllTrainBookingPage() {
		ModelAndView andView=new ModelAndView("AllTrainBookingPage");
		andView.addObject("list",trainRepository.getAllTrain());
		return andView;
	}

	public ModelAndView loadBookTrainForm(int id, HttpSession session) {
		ModelAndView andView=new ModelAndView("BookTrainForm");
		andView.addObject("train",trainRepository.getById(id));
		session.setAttribute("trainToBeBooked", trainRepository.getById(id));
		User user=(User)session.getAttribute("user");
		andView.addObject("user",user);
		return andView;
	}
	
	

}
