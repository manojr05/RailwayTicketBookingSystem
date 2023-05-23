package com.ticket.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("bookTicket")
	public ModelAndView bookTicket(HttpSession session) {
		return service.bookTicket(session);
	}
	
	@GetMapping("loadShowAllTicketPage")
	public ModelAndView loadShowAllTicketPage(HttpSession session) {
		return service.loadShowAllTicketPage(session);
	}
	
	@GetMapping("cancelTicket")
	public ModelAndView cancelTicket(@RequestParam int pnr, HttpSession session) {
		return service.cancelTicket(pnr, session);
	}
	
	@GetMapping("deleteTicket")
	public ModelAndView deleteTicket(@RequestParam int pnr) {
		return service.deleteTicket(pnr);
	}
	
	
	
}
