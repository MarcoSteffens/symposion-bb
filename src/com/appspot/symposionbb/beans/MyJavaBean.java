package com.appspot.symposionbb.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyJavaBean {
	
	String DateString = "";
	
	public String getDateString() {
		  
		return (new SimpleDateFormat("yyyy-MM-dd, HH:mm:ss")).format(new Date()) + " h";
	    
	}
}

