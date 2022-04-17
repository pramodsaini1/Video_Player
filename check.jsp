<%-- 
    Document   : check
    Created on : 24 Feb, 2022, 9:03:24 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("email").length()==0||request.getParameter("pass").length()==0){
    response.sendRedirect("index.jsp?empty=1");
}
else{
    String email=request.getParameter("email");
    String pass = request.getParameter("pass");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("Select * from admin where email='"+email+"'");
        if(rs.next()){
            if(rs.getString("password").equals(pass)){
                Cookie c=new Cookie("login",email);
                c.setMaxAge(3600);
                response.addCookie(c);
                response.sendRedirect("index.jsp");
            }
            else{
                response.sendRedirect("index.jsp?invalid_password");
            }
        }
        else{
            response.sendRedirect("index.jsp?invalid_email=1");
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
    
%>
