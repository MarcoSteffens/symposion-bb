package com.appspot.symposionbb.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Board {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

    @Persistent
    private String title;

    @Persistent
    private String note;
    
    @Persistent
    private Integer index;

    @Persistent
    private Date date;
    
    @Persistent
    private List<Thread> threads = new ArrayList<Thread>();

//    @Persistent
//    private List<String> moderators;

	public Board(String title, String note) {
        this.title = title;
        this.note = note;
        this.date = new Date();
    }

    public Key getKey() {
        return key;
    }

    public String getTitle() {
        return title;
    }

    public String getNote() {
        return note;
    }
    
    public Integer getIndex() {
    	return index;
    }

    public Date getDate() {
        return date;
    }

//    public List<String> getModerators() {
//        return moderators;
//    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    public void setIndex(Integer index) {
    	this.index = index;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Thread> getThreads() {
		return threads;
	}

	public void addThread(Thread thread) {
		//TODO: vernünftige Thread-Sortierung!
		this.threads.add(thread);
	}
	

}