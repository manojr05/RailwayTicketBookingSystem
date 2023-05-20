package com.train.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TrainRepository {
	
	@Autowired
	EntityManager manager;

	public void save(Train train) {
		manager.getTransaction().begin();
		manager.persist(train);
		manager.getTransaction().commit();
	}

	public List<Train> getAllTrain() {
		Query query = manager.createQuery("select t from Train t");
		List<Train> list = query.getResultList();
		return list;
	}
	
	public Train getById(int id) {
		return manager.find(Train.class, id);
	}

	public void update(Train train) {
		manager.getTransaction().begin();
		manager.merge(train);
		manager.getTransaction().commit();
	}

	public void delete(Train byId) {
		manager.getTransaction().begin();
		manager.remove(byId);
		manager.getTransaction().commit();
	}
	
	
}
