package com.appspot.symposionbb.model;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;

import org.apache.commons.lang.StringEscapeUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Inheritance;
import javax.jdo.annotations.InheritanceStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

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

    public Posting(String author, String content) {
    	
        this.author = author.trim();
        this.content = new Text(convert(content));
        this.date = new Date();
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
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = new Text(convert(content));
    }

    public void setDate(Date date) {
        this.date = date;
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