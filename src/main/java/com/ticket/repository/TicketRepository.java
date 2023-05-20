package com.ticket.repository;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.user.repository.User;

@Repository
public class TicketRepository {

	@Autowired
	EntityManager manager;

	public void saveTicket(Ticket ticket) {
		manager.getTransaction().begin();
		manager.persist(ticket);
		manager.getTransaction().commit();
	}

	public Ticket getTicketByPnr(int pnr) {
		return manager.find(Ticket.class, pnr);
	}

	public void updateTicket(Ticket ticket) {
		manager.getTransaction().begin();
		manager.merge(ticket);
		manager.getTransaction().commit();
	}
}
