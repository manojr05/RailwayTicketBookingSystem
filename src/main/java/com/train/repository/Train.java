package com.train.repository;

import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Train {
	@Id
	int trainId;
	String trainName;
	int totalSeats;
	String[] stations;
	String[] prices;	
	String[] time;
	String[] days;
}
	