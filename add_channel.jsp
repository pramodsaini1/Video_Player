<%-- 
    Document   : add_channel
    Created on : 24 Feb, 2022, 9:52:11 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*,java.util.Date" pageEncoding="UTF-8"%>
<%
 String email=null ;
 Cookie c[]=request.getCookies();
 for(int i=0;i<c.length;i++){
     if(c[i].getName().equals("login")){
         email=c[i].getValue();
         break;
     }
 }
 if(email==null){
     response.sendRedirect("index.jsp");
 }
 else{
     if(request.getParameter("cname").length()==0||request.getParameter("category").length()==0){
         response.sendRedirect("dashboard.jsp?empty=1");
     }
     else{
         String cname=request.getParameter("cname");
         String category = request.getParameter("category");
         
         int sn=0;
         String code="";
         try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
             Statement st = cn.createStatement();
             ResultSet rs = st.executeQuery("select Max(sn) from channel");
             if(rs.next()){
                 sn= rs.getInt(1);
             }
             sn=sn+1 ;
         }
         catch(Exception er){
             out.print(er.getMessage());
         }
         
         LinkedList l  = new LinkedList();
         for(char f='A';f<='Z';f++){
             l.add(f+"");
         }
         for(char f='a';f<='z';f++){
             l.add(f+"");
         }
         for(char f='0';f<='9';f++){
             l.add(f+"");
         }
         Collections.shuffle(l);
         for(int i=0;i<6;i++){
             code=code+l.get(i);
         }
         code=code+"_"+sn;
         int status=0;
         Date date = new Date();
         String dt = date.toString();
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
             PreparedStatement ps = cn.prepareStatement("insert into channel values(?,?,?,?,?,?,?)");
             ps.setInt(1,sn);
             ps.setString(2,code);
             ps.setString(3,cname);
             ps.setString(4,category);
             ps.setString(5,email);
             ps.setString(6,dt);
             ps.setInt(7,status);
             
             if(ps.executeUpdate()>0){
                 response.sendRedirect("channel_image.jsp?code="+code+"&success=1");
             }
             else{
                    response.sendRedirect("dashboard.jsp?again=1"); 
             }
         }
         catch(Exception ep){
             out.print(ep.getMessage());
         }
         
         
     }
 }
    
%>