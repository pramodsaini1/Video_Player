<%-- 
    Document   : logout
    Created on : 24 Feb, 2022, 9:54:10 AM
    Author     : Genius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Cookie c=new Cookie("login"," ");
  c.setMaxAge(0);
  response.addCookie(c);
  response.sendRedirect("index.jsp");
    
    
    
    
%>
