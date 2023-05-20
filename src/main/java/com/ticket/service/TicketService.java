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

		// setting the known attributes
		ticket.setDateOfJourney(Date.valueOf(dateOfJourneyy));
		ticket.setDateOfBooking(Date.valueOf(LocalDate.now()));

		// getting the session attribute
		Train train = (Train) session.getAttribute("trainToBeBooked");
		User user = (User) session.getAttribute("user");

		System.out.println(user);
		System.out.println(train);

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
			andView.addObject("alert", "please choose minimum of 1 seat");
		} else {

			if (train.getTotalSeats() < ticket.getNumberOfSeats()) {
				andView.setViewName("AllTrainBookingPage");
				andView.addObject("list",trainRepository.getAllTrain());
				andView.addObject("alert", "Sorry, no seats availabel for the selected train.");
			} else {

				boolean flag = true;

				for (String day : train.getDays()) {
					if (day.equalsIgnoreCase(ticket.getDateOfJourney().toLocalDate().getDayOfWeek()
							.getDisplayName(TextStyle.FULL, Locale.ENGLISH))) {
						flag = false;
					}
				}

				if (Period.between(ticket.getDateOfBooking().toLocalDate(), ticket.getDateOfJourney().toLocalDate())
						.getDays() < 0 || flag) {
					andView.setViewName("BookTrainForm");
					andView.addObject("alert", "Train Not Available For The Selected Date");
				} else {
					if (user.getInr() < totalAmount) {
						andView.setViewName("UserMainPage");
						andView.addObject("alert", "Insufficient Balance");
					} else {

						andView.setViewName("UserMainPage");
						ticket.setAmount(totalAmount);
						ticket.setStatus("booked");
						ticket.setUser(user);
						ticket.setTrainId(train.getTrainId());

						repository.saveTicket(ticket);

						List<Ticket> tickets = user.getTicket();

						if (tickets == null) {
							tickets = new ArrayList<>();
						}
						tickets.add(ticket);

						user.setTicket(tickets);
						user.setInr(user.getInr() - totalAmount);

						userRepository.updateUser(user);

						train.setTotalSeats(train.getTotalSeats() - ticket.getNumberOfSeats());

						trainRepository.update(train);

					}

				}
			}

		}

		return andView;
	}

}
