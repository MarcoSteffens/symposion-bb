package com.appspot.symposionbb.model;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Inheritance;
import javax.jdo.annotations.InheritanceStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import org.apache.commons.lang.StringEscapeUtils;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;

@PersistenceCapable
@Inheritance(strategy = InheritanceStrategy.SUBCLASS_TABLE)
public abstract class Posting {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

    @Persistent
    private String author;

    @Persistent
    private Text content;
    
    @Persistent
    private Date date;
    
    @Persistent
    private boolean deleted;

    public Posting(String author, String content) {
    	
        this.author = author.trim();
        this.content = new Text(convert(content));
        this.date = new Date();
        this.deleted = false;
    }
    
    public Key getKey() {
        return key;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content.getValue();
    }

    public Date getDate() {
        return date;
    }
    
    public boolean isDeleted() {
    	return deleted;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = new Text(convert(content));
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public void setDeleted(boolean state) {
    	this.deleted = state;
    }
    
    private String convert(String content) {
    	
    	content = content.trim();
    	//content = "<p>" + content + "</p>";
    	content = StringEscapeUtils.escapeHtml(content);
    	content = content.replace("\r\n\r\n", "</p><p>");
    	content = content.replace("\r\n", "<br />");
    	content = content.replace("<br /><br />", "</p><p>");
    	
    	return content;
    }
   
}