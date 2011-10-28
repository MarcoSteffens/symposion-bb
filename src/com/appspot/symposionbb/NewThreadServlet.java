package com.appspot.symposionbb;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.appspot.symposionbb.model.Board;
import com.appspot.symposionbb.model.Thread;

public class NewThreadServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(NewThreadServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {

    	String forumKey = req.getParameter("forumKey");
    	String boardKey = req.getParameter("boardKey");
    	String threadKey = "";//req.getParameter("threadKey");
    	String title = req.getParameter("topicTitle");
    	String content = req.getParameter("threadContent");
    	String author = req.getParameter("threadAuthor");

    	HttpSession session = req.getSession();
    	session.setAttribute("Author", author);
    	
        Thread thread = new Thread(author, title, content);

        PersistenceManager pm = PMF.get().getPersistenceManager();

    	String query = "SELECT FROM " + Board.class.getName();// + " WHERE Key='" + boardKey + "'";
    	List<Board> boards = (List<Board>) pm.newQuery(query).execute();
    	Board board = null;
    	
    	for (Board b : boards) {
    		if (b.getKey().getId() == Long.parseLong(boardKey)) {
    			board = b;
    		}
    	}

    	if (board == null) {
    		resp.sendRedirect("/error.jsp");
    	}

    	board.addThread(thread);

    	Thread t = null;
    	try {
            t = pm.makePersistent(thread);
    	} catch (Throwable th) {
    		resp.sendRedirect("/error.jsp?catch");
        } finally {
            pm.close();
        }
        
    	if (t == null) {
    		resp.sendRedirect("/error.jsp");
    	}
        threadKey = ((Long) t.getKey().getId()).toString();
        resp.sendRedirect("/forum.jsp?board=" + boardKey + "&thread=" + threadKey);
    }
}