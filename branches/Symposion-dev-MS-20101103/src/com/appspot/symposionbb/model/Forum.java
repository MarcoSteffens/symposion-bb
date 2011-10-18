package com.appspot.symposionbb.model;


import com.appspot.symposionbb.model.Board;
import com.google.appengine.api.datastore.Key;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


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
    private Integer index;

    @Persistent
    private Date date;
    
    @Persistent
    private List<Board> boards = new ArrayList<Board>(); //Todo: LinkesList?

    public Forum(String name, String description) {
        this.name = name;
        this.description = description;
        this.date = new Date();
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