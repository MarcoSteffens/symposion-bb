package com.appspot.symposionbb;

import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.users.User;

@PersistenceCapable
public class Forum {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;
	
	@Persistent
	private String title;
	
	@Persistent
	private String description;
	
//	@Persistent
//	private List<Board> boards;
	
	@Persistent
	private Date date;
	
    public Forum(String title, String description, Date date) {
        this.title = title;
        this.description = description;
        this.date = date;
    }

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Key getKey() {
		return key;
	}

	public Date getDate() {
		return date;
	}
	
    
}
