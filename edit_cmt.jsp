<%-- 
    Document   : edit_cmt
    Created on : 18 Mar, 2022, 12:35:26 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null){
    out.print("Login");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null){
                String code = request.getParameter("code");
                Statement st1 = cn.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from comment where email='"+email+"' AND code='"+code+"'");
                if(rs1.next()){
                    %>
                     
         
                    <%
                }
                
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>
