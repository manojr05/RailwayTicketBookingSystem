package com.train.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.train.repository.Train;
import com.train.service.TrainService;

@Controller
public class TrainController {

	@Autowired
	TrainService service;

	@GetMapping("loadAdminLoginPage")
	public ModelAndView loadAdminLoginPage() {
		return service.loadAdminLoginPage();
	}

	@PostMapping("loadAdminMainPage")
	public ModelAndView loadAdminMainPage(@RequestParam int id, @RequestParam String password) {
		return service.loadAdminMainPage(id, password);
	}

	@GetMapping("loadAddTrainPage")
	public ModelAndView loadAddTrainPage() {
		return service.loadAddTrainPage();
	}

	@PostMapping("addTrain")
	public ModelAndView addTrain(@ModelAttribute Train train, @RequestParam String stations, @RequestParam String prices, @RequestParam String times, @RequestParam String days) {
		return service.addTrain(train, stations, prices, times, days);
	}
	
	@GetMapping("viewAllTrain")
	public ModelAndView viewAllTrain() {
		return service.viewAllTrain();
	}
	
	@GetMapping("loadEditTrain")
	public ModelAndView editTrain(@RequestParam int id) {
		return service.loadEditTrainPage(id);
	}
	
	@PostMapping("saveEdit")
	public ModelAndView saveEdit(@ModelAttribute Train train, @RequestParam String stations, @RequestParam String prices, @RequestParam String times, @RequestParam String days) {
		return service.saveEdit(train, stations, prices, times, days);
	}
	
	@GetMapping("deleteTrain")
	public ModelAndView deleteTrain(@RequestParam int id) {
		return service.deleteTrain(id);
	}
	
	
	@GetMapping("loadSearchTrainByIdPage")
	public ModelAndView loadSearchTrainByIdPage() {
		return service.loadSearchTrainByIdPage();
	}
	
	@PostMapping("loadSearchedTrainById")
	public ModelAndView loadSearchedTrainById(@RequestParam int trainId) {
		return service.loadSearchedTrainById(trainId);
	}
}
