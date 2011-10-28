package com.appspot.symposionbb;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.appspot.symposionbb.model.Board;
import com.appspot.symposionbb.model.Comment;
import com.appspot.symposionbb.model.Thread;

public class NewCommentServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(NewCommentServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {

    	String forumKey = req.getParameter("forumKey");
    	String boardKey = req.getParameter("boardKey");
    	String threadKey = req.getParameter("threadKey");
    	String title = req.getParameter("topicTitle");
    	String content = req.getParameter("threadContent");
    	String author = req.getParameter("threadAuthor");
    	
        Comment comment = new Comment(author, content);
        
        PersistenceManager pm = PMF.get().getPersistenceManager();

    	String query = "SELECT FROM " + Board.class.getName();// + " WHERE Key='" + boardKey + "'";
    	List<Board> boards = (List<Board>) pm.newQuery(query).execute();

    	Board board = null;
    	for (Board b : boards) {
    		if (b.getKey().getId() == Long.parseLong(boardKey)) {
    			board = b;
    			//break;
    		}
    	}

    	if (board == null) {
    		resp.sendRedirect("/error.jsp");
    	}
    	
    	List<Thread> threads = board.getThreads();
    	
    	Thread thread = null;
    	
    	for (Thread t : threads) {
    		if (t.getKey().getId() == Long.parseLong(threadKey)) {
    			thread = t;
    			break;
    		}
    	}

    	if (thread == null) {
    		resp.sendRedirect("/error.jsp");
    	}

    	thread.addReply(comment);

    	try {
    		pm.makePersistent(comment);
    	} catch (Throwable th) {
    		resp.sendRedirect("/error.jsp?catch");
        } finally {
            pm.close();
        }

        threadKey = ((Long) thread.getKey().getId()).toString();
        resp.sendRedirect("/forum.jsp?board=" + boardKey + "&thread=" + threadKey);
    }
}