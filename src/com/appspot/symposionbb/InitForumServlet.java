package com.appspot.symposionbb;

import java.io.IOException;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.symposionbb.model.Board;
import com.appspot.symposionbb.model.Forum;

public class InitForumServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(InitForumServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {

    	String forumName = req.getParameter("forumName");
    	String forumDescription = req.getParameter("forumDescription");
//        String title = req.getParameter("title");
//        String note = req.getParameter("note");
//        String order = req.getParameter("order");
    	
    	String userManagement = req.getParameter("userManagement");
    	String userRights = req.getParameter("userRights");
        
        Forum forum = new Forum(forumName, forumDescription, userManagement, userRights);
        Board board = new Board("Forum", "Das Basis-Board");

        forum.addBoard(board);
        
        PersistenceManager pm = PMF.get().getPersistenceManager();

        try {
            pm.makePersistent(forum);
            //pm.makePersistent(board);
        } finally {
            pm.close();
        }

        resp.sendRedirect("/forum.jsp");
    }
}