package com.ticket.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.ticket.repository.Ticket;
import com.ticket.repository.TicketRepository;
import com.train.repository.Train;
import com.train.repository.TrainRepository;
import com.user.repository.MyRepository;
import com.user.repository.User;

@Service
public class TicketService {

	@Autowired
	TicketRepository repository;

	@Autowired
	MyRepository userRepository;

	@Autowired
	TrainRepository trainRepository;

	public ModelAndView loadTicketAmountPage(Ticket ticket, String dateOfJourneyy, HttpSession session) {
		ModelAndView andView = new ModelAndView();

		if (session.getAttribute("user") == null) {
			andView.setViewName("UserLogin");
			andView.addObject("alert", "session expired, please login again");
		} else {

			// setting the known attributes
			ticket.setDateOfJourney(Date.valueOf(dateOfJourneyy));
			ticket.setDateOfBooking(Date.valueOf(LocalDate.now()));

			// getting the session attribute
			Train train = (Train) session.getAttribute("trainToBeBooked");
			User user = (User) session.getAttribute("user");

			session.removeAttribute("trainToBeBooked");
			session.removeAttribute("user");

			String[] prices = train.getPrices();
			String[] stations = train.getStations();

			// calculating ticket fare
			int start = -1;
			int end = -1;
			int amount = 0;

			for (int i = 0; i < stations.length; i++) {
				if (stations[i].equals(ticket.getSource())) {
					start = i;
				}
			}
			for (int i = 0; i < stations.length; i++) {
				if (stations[i].equals(ticket.getDestination())) {
					end = i;
				}
			}

			for (int i = start + 1; i <= end; i++) {
				amount += Integer.parseInt(prices[i]);
			}

			int totalAmount = amount * ticket.getNumberOfSeats();

			if (ticket.getNumberOfSeats() <= 0) {
				andView.setViewName("BookTrainForm");
				andView.addObject("user",user);
				andView.addObject("alert", "please choose minimum of 1 seat");
			} else {
				if (train.getTotalSeats() < ticket.getNumberOfSeats()) {
					andView.setViewName("AllTrainBookingPage");
					andView.addObject("list", trainRepository.getAllTrain());
					andView.addObject("user",user);
					andView.addObject("alert", "Sorry, no seats availabel for the selected train.");
				} else {

					boolean flag = true;

					for (String day : train.getDays()) {
						if (day.equalsIgnoreCase(ticket.getDateOfJourney().toLocalDate().getDayOfWeek()
								.getDisplayName(TextStyle.FULL, Locale.ENGLISH))) {
							flag = false;
						}
					}

					if (Period.between(ticket.getDateOfBooking().toLocalDate(), ticket.getDateOfJourney().toLocalDate()).getDays() < 0 || flag) {
						andView.setViewName("BookTrainForm");
						andView.addObject("user",user);
						andView.addObject("train",train);
						andView.addObject("alert", "Train Not Available For The Selected Date");
					} else {
						if (user.getInr() < totalAmount) {
							andView.setViewName("UserMainPage");
							andView.addObject("user",user);
							andView.addObject("alert", "Insufficient Balance");
						} else {

							andView.setViewName("TicketAmountPage");
							ticket.setAmount(totalAmount);
							ticket.setUser(user);
							ticket.setTrainId(train.getTrainId());

							List<Ticket> tickets = user.getTicket();

							if (tickets == null) {
								tickets = new ArrayList<>();
							}
							tickets.add(ticket);

							user.setTicket(tickets);
							user.setInr(user.getInr() - totalAmount);

							train.setTotalSeats(train.getTotalSeats() - ticket.getNumberOfSeats());
							andView.addObject("user",user);
							andView.addObject("ticket", ticket);
							session.setAttribute("ticket", ticket);
							session.setAttribute("trainToBeBooked", train);
							session.setAttribute("user", user);
						}
					}
				}
			}
		}

		return andView;
	}

	public ModelAndView bookTicket(HttpSession session) {

		ModelAndView andView = new ModelAndView();

		if (session.getAttribute("user") == null) {
			andView.setViewName("UserLogin");
			andView.addObject("alert", "session expired, please login again");
		} else {
			andView.setViewName("UserMainPage");
			Ticket ticket = (Ticket) session.getAttribute("ticket");
			ticket.setStatus("booked");

			Train train = (Train) session.getAttribute("trainToBeBooked");
			User user = (User) session.getAttribute("user");

			repository.saveTicket(ticket);
			userRepository.updateUser(user);
			trainRepository.update(train);

			andView.addObject("alert", "Ticket Booked, your PNR No is " + ticket.getPnr() + "");

			session.removeAttribute("trainToBeBooked");
		}

		return andView;
	}

	public ModelAndView loadShowAllTicketPage(HttpSession session) {
		ModelAndView andView = new ModelAndView();

		if (session.getAttribute("user") == null) {
			andView.setViewName("UserLogin");
			andView.addObject("alert", "session expired, please login again");
		} else {
			andView.setViewName("ViewAllTicket");
			User user = (User) session.getAttribute("user");
			andView.addObject("list", user.getTicket());
		}
		return andView;
	}

	public ModelAndView cancelTicket(int pnr, HttpSession session) {
		ModelAndView andView = new ModelAndView();

		if (session.getAttribute("user") == null) {
			andView.setViewName("UserLogin");
			andView.addObject("alert", "session expired, please login again");
		} else {
			andView.setViewName("ViewAllTicket");

			Ticket ticket = repository.getTicketByPnr(pnr);

			User user = (User) session.getAttribute("user");

			if (Period.between(LocalDate.now(), ticket.getDateOfJourney().toLocalDate()).getDays() > 1) {
				ticket.setStatus("cancelled");
				user.setInr(ticket.getAmount() + user.getInr());
				repository.updateTicket(ticket);
				userRepository.updateUser(user);
				session.removeAttribute("user");
				session.setAttribute("user", user);
				andView.addObject("list", user.getTicket());
			} else {
				andView.addObject("alert", "Ticket cannot be cancelled because the train is departing today.");
				andView.addObject("list", user.getTicket());
			}
		}
		return andView;

	}

	public ModelAndView deleteTicket(int pnr) {
		ModelAndView andView = new ModelAndView("ViewAllTicket");
		Ticket ticket = repository.getTicketByPnr(pnr);
		repository.deleteTicket(ticket);
		andView.addObject("list", repository.getAllTicket());
		return andView;
	}
}
