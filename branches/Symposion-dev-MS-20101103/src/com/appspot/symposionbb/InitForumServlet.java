package com.appspot.symposionbb;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;
import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import com.appspot.symposionbb.model.Board;
import com.appspot.symposionbb.model.Forum;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import com.appspot.symposionbb.*;

public class InitForumServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(InitForumServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {

    	String forumName = req.getParameter("forumName");
    	String forumDescription = req.getParameter("forumDescription");
//        String title = req.getParameter("title");
//        String note = req.getParameter("note");
//        String order = req.getParameter("order");
        
        Forum forum = new Forum(forumName, forumDescription);
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