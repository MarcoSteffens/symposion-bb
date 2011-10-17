package com.appspot.symposionbb.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@Controller
@RequestMapping("/hello")
public class HelloController {

    private UserService userService = UserServiceFactory.getUserService();

    @RequestMapping(method = RequestMethod.GET)
    public String hello(HttpServletRequest request, ModelMap model)
    {
        String url = request.getRequestURI();
        String message;

        if(request.getUserPrincipal() != null)
        {
            message = new StringBuilder()
            .append("Hello, ")
            .append(request.getUserPrincipal().getName())
            .append("! You can <a href=\"")
            .append(userService.createLogoutURL(url))
            .append("\">Sign Out</a>.").toString();
        }else{
            message = new StringBuilder()
            .append("Please ")
            .append("<a href=\"")
            .append(userService.createLoginURL(url))
            .append("\">Sign In</a>.").toString();
        }

        model.addAttribute("message", message);

        return "hello/hello";
    }

}