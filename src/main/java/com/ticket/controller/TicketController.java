package com.ticket.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ticket.repository.Ticket;
import com.ticket.service.TicketService;

@Controller
public class TicketController {
	
	@Autowired
	TicketService service;
	
	@PostMapping("loadAmountPage")
	public ModelAndView loadTicketAmountPage(@ModelAttribute Ticket ticket, String dateOfJourneyy, HttpSession session) {
		return service.loadTicketAmountPage(ticket, dateOfJourneyy, session);
	}
	
}
