package com.user.repository;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyRepository {
	
	@Autowired
	EntityManager manager;

	public void saveNewUser(User user) {
		manager.getTransaction().begin();
		manager.persist(user);
		manager.getTransaction().commit();
	}
	
	public User getUserById(int id) {
		return manager.find(User.class, id);
	}
	
	public void updateUser(User user) {
		manager.getTransaction().begin();
		manager.merge(user);
		manager.getTransaction().commit();
	}
	
}
