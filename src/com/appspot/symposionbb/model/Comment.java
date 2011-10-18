package com.appspot.symposionbb.model;

import javax.jdo.annotations.PersistenceCapable;

@PersistenceCapable
public class Comment extends Posting {

    public Comment(String author, String content) {
    	
    	super(author, content);
    }
   
}