package com.appspot.symposionbb;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class ForumUser {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

	@Persistent
	private String name;

	@Persistent
	private String email;

	@Persistent
	private Boolean frozen;

	@Persistent
	private Date lastAction;
	
	@Persistent
	private Date date;
	
	public ForumUser(String name, String email, Date lastAction, Date date) {
		
		this.name = name;
		this.email = email;
		this.frozen = false;
		this.lastAction = lastAction;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getFrozen() {
		return frozen;
	}

	public void setFrozen(Boolean frozen) {
		this.frozen = frozen;
	}

	public Date getLastAction() {
		return lastAction;
	}

	public void setLastAction(Date lastAction) {
		this.lastAction = lastAction;
	}

	public Key getKey() {
		return key;
	}

	public Date getDate() {
		return date;
	}
}
