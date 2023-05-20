package com.train.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.train.repository.Train;
import com.train.repository.TrainRepository;

@Service
public class TrainService {

	@Autowired
	TrainRepository repository;

	public ModelAndView loadAdminLoginPage() {
		ModelAndView andView = new ModelAndView("AdminLogin");
		return andView;
	}

	public ModelAndView loadAdminMainPage(int id, String password) {
		ModelAndView andView = new ModelAndView();
		if (id == 805080) {
			if (password.equals("password")) {
				andView.setViewName("AdminMainPage");
			} else {
				andView.setViewName("AdminLogin");
				andView.addObject("alert", "wrong password");
			}
		} else {
			andView.setViewName("AdminLogin");
			andView.addObject("alert", "wrong username or password");
		}
		return andView;
	}

	public ModelAndView loadAddTrainPage() {
		ModelAndView andView = new ModelAndView("AddTrain");
		return andView;
	}

	public ModelAndView addTrain(Train train, String stations, String prices, String times, String days) {
		ModelAndView andView = new ModelAndView("AdminMainPage");

		train.setStations(stations.split(","));
		train.setPrices(prices.split(","));
		train.setTime(times.split(","));
		train.setDays(days.split(","));

		repository.save(train);

		andView.addObject("message", "train added successfully");
		return andView;
	}

	public ModelAndView viewAllTrain() {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("ViewAllTrain");
		andView.addObject("list", repository.getAllTrain());
		return andView;
	}

	public ModelAndView loadEditTrainPage(int id) {
		ModelAndView andView = new ModelAndView("EditTrainPage");
		andView.addObject("train", repository.getById(id));
		return andView;
	}

	public ModelAndView saveEdit(Train train, String stations, String prices, String times, String days) {
		ModelAndView andView = new ModelAndView("ViewAllTrain");
		andView.addObject("alert", "updated successfully");
		andView.addObject("list", repository.getAllTrain());
		train.setStations(stations.split(","));
		train.setPrices(prices.split(","));
		train.setTime(times.split(","));
		train.setDays(days.split(","));
		repository.update(train);
		return andView;
	}

	public ModelAndView deleteTrain(int id) {
		ModelAndView andView = new ModelAndView("ViewAllTrain");
		Train byId = repository.getById(id);
		repository.delete(byId);
		andView.addObject("alert", "deleted successfully");
		andView.addObject("list", repository.getAllTrain());
		return andView;
	}
}
