package com.ticket.repository;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import com.user.repository.User;
import lombok.Data;

@Entity
@Data
public class Ticket {
	@Id
	@GeneratedValue(generator = "pnr")
	@SequenceGenerator(initialValue = 4566541,allocationSize = 1,name = "pnr",sequenceName = "pnr")
	int pnr;
	int trainId;
	String source;
	String destination;
	int numberOfSeats;
	double amount;
	Date dateOfBooking;
	Date dateOfJourney;
	String status;

	@ManyToOne
	User user;
}
