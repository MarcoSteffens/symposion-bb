package com.appspot.symposionbb;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

public class Post {

	@PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

	@Persistent
	private String subject;

	@Persistent
	private String parent_id;

	@Persistent
	private String user_id;

	@Persistent
	private String board_id;

	@Persistent
	private String content;

	@Persistent
	private Boolean deleted;

	@Persistent
	private Date date;
	
	public Post(String subject, String parent_id, String user_id, String board_id, String content, Date date) {
		
		this.subject = subject;
		this.parent_id = parent_id;
		this.user_id = user_id;
		this.board_id = board_id;
		this.content = content;
		this.deleted = false;
		this.date = date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public Key getKey() {
		return key;
	}

	public Date getDate() {
		return date;
	}
	
	
}
