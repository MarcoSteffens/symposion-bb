package com.appspot.symposionbb.model;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class Thread extends Posting {

    @Persistent
    private String title;

    @Persistent
    private List<Comment> reply = new ArrayList<Comment>();

    public Thread(String author, String title, String content) {
    	
    	super(author, content);
    	
        this.title = title;
    }
    
    public String getTitle() {
        return title;
    }
    
    public List<Comment> getReply() {
    	return reply;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void addReply(Comment reply) {
    	this.reply.add(reply);
    }
}