package com.appspot.symposionbb;

import java.util.Date;

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
	private String board;
	
	@Persistent
	private String forum_id;
	
	@Persistent
	private Boolean archived;
	
	@Persistent
	private int order;
	
	@Persistent
	private Date date;
	
	public Board(String board, String forum_id, Date date) {
		
		this.board = board;
		this.forum_id = forum_id;
		this.archived = false;
		this.order = 0;	//TODO: Vernünftige Sortierung einbauen.
		this.date = date;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getForum_id() {
		return forum_id;
	}

	public void setForum_id(String forum_id) {
		this.forum_id = forum_id;
	}

	public Boolean getArchived() {
		return archived;
	}

	public void setArchived(Boolean archived) {
		this.archived = archived;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public Key getKey() {
		return key;
	}

	public Date getDate() {
		return date;
	}
	
	
}
