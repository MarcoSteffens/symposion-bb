package com.appspot.symposionbb.view;

import java.util.List;

import javax.jdo.PersistenceManager;

import com.appspot.symposionbb.PMF;
import com.appspot.symposionbb.model.Board;
import com.appspot.symposionbb.model.Thread;


public class ForumBean {

	private List<Board> boards;
	private List<Thread> threads;
	private List<String> moderators;

    //PersistenceManager pm = PMF.get().getPersistenceManager();

	public ForumBean() {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String query = "";
		
	    query = "select from " + Board.class.getName();
	    this.boards = (List<Board>) pm.newQuery(query).execute();

//	    this.threads = boards.get(0).getThreads();
	    
	    //this.moderators = boards.get(0).getModerators();

	    pm.close();		
	}
	
	public List<Board> getBoards() {
		return boards;
	}
	
	public List<Thread> getThreads() {
		return threads;
	}
	
	public List<String> getModerators() {
		return moderators;
	}
}
