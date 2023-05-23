package com.ticket.repository;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<Ticket> getAllTicket() {
		Query query = manager.createQuery("select t from Ticket t");
		List<Ticket> list = query.getResultList();
		return list;
	}
	
	public void deleteTicket(Ticket ticket) {
		manager.getTransaction().begin();
		manager.remove(ticket);
		manager.getTransaction().commit();
	}
}
