package com.appspot.symposionbb;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


public class InitForumServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(InitForumServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String boardname = req.getParameter("board");
        Date date = new Date();
        Forum forum = new Forum(title, description, date);
        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(forum);
        } finally {
//            pm.close();
        }
        
//        PersistenceManager pm = PMF.get().getPersistenceManager();
//        String query = "select from " + Greeting.class.getName();
//        List<Greeting> greetings = (List<Greeting>) pm.newQuery(query).execute();

        String query = "select from " + Forum.class.getName();
        List<Forum> forums = (List<Forum>) pm.newQuery(query).execute();
        forum = forums.get(0);
        
        Board board = new Board(boardname, forum.getKey().toString(), new Date());
//        Board board = new Board(boardname, forum.getKey().toString(), new Date());
        
        pm = PMF.get().getPersistenceManager();
        try {
           pm.makePersistent(board);
        } finally {
//            pm.close();
        }
        ForumUser owner = new ForumUser(user.getNickname(), user.getEmail(), date, date);

        pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(owner);
        } finally {
            pm.close();
        }

        resp.sendRedirect("/");
    }
}



