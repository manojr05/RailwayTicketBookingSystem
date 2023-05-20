package com.user.repository;

import java.sql.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import com.ticket.repository.Ticket;
import lombok.Data;

@Entity
@Data
public class User {
	@Id
	@GeneratedValue(generator = "idGenerator")
	@SequenceGenerator(name = "idGenerator", sequenceName = "idGenerator", initialValue = 1000, allocationSize = 1)
	int id;
	String name;
	long phoneNo;
	String email;
	Date dob;
	String gender;
	String password;
	int age;
	double inr;
	
	@OneToMany
	List<Ticket> ticket;
}
