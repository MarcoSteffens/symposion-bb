package com.appspot.symposionbb.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.appspot.symposionbb.SymposionConsts;
import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Forum {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key key;

    @Persistent
    private String name;

    @Persistent
    private String description;

    @Persistent
    private String userManagement;

    @Persistent
    private String userRights;

    @Persistent
    private Integer index;

    @Persistent
    private Date date;
    
    @Persistent
    private List<Board> boards = new ArrayList<Board>(); //Todo: LinkedList?

    public Forum(String name, String description) {
        this.name = name;
        this.description = description;
        this.date = new Date();
    }

    public Forum(String name, String description, String userManagement, String userRights) {
        this.name = name;
        this.description = description;
        this.date = new Date();
        
        
        if (userManagement.equals(SymposionConsts.USER_MANAGEMENT_NONE))
        	this.userManagement = userManagement;
       	else if (userManagement.equals(SymposionConsts.USER_MANAGEMENT_GOOGLE))
        	this.userManagement = userManagement;
       	else if (userManagement.equals(SymposionConsts.USER_MANAGEMENT_NATIVE))
        	this.userManagement = userManagement;
       	else
        	this.userManagement = SymposionConsts.USER_MANAGEMENT_NONE;
        
        if (userRights.equals(SymposionConsts.USER_RIGHTS_UNRESTRICTED))
            this.userRights = userRights;
        else if (userRights.equals(SymposionConsts.USER_RIGHTS_RESTRICTED))
        	this.userRights = userRights;
        else if (userRights.equals(SymposionConsts.USER_RIGHTS_CLOSED))
        	this.userRights = userRights;
        else
        	this.userRights = SymposionConsts.USER_RIGHTS_UNRESTRICTED;
    }
    
    public boolean isRegistrationPossible() {
    	if (this.userManagement.equals(SymposionConsts.USER_MANAGEMENT_GOOGLE)){}
    	
    	return true;
    }
    
    public boolean isRegistrationNeededForReading(){
    	
    	if (this.userRights.equals(SymposionConsts.USER_RIGHTS_CLOSED))
    		return true;
    	
    	return false;
    }
    
    public boolean isRegistrationNeededForWriting() {
    	
    	if (this.userRights.equals(SymposionConsts.USER_RIGHTS_UNRESTRICTED))
    		return false;
    	
    	return true;
    }
    
    public String getUserManagement() {
    	return userManagement;
    }
    
    public String getUserRights() {
    	return userRights;
    }

    public Key getKey() {
        return key;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
    
    public Integer getIndex() {
    	return index;
    }

    public Date getDate() {
        return date;
    }
    
    public List<Board> getBoards() {
    	return boards;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setIndex(Integer index) {
    	this.index = index;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    
    public void addBoard(Board board) {
    	
    	//this.boards.add(board);
    	addBoardAtPosition(board, boards.size());
    }
    
    public void addBoardAtPosition(Board board, Integer position) {
    	
    	if (this.boards.contains(board))
    		this.boards.remove(board);
    	
    	this.boards.add(position, board);
    	board.setIndex(this.boards.indexOf(board));
    }
}