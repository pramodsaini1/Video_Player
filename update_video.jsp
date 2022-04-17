<%-- 
    Document   : update_video
    Created on : 27 Feb, 2022, 2:24:44 PM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("code")==null&&request.getParameter("ccode")==null){
    response.sendRedirect("dashboard.jsp?code_err=1");
}
else{
    String code=request.getParameter("code");
    String ccode=request.getParameter("ccode");
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
        if(request.getParameter("vname").length()==0||request.getParameter("des").length()==0){
            response.sendRedirect("edit.jsp?code="+code+"&ccode="+ccode+"&empty=1");
        }
        else{
            String vname=request.getParameter("vname");
            String des = request.getParameter("des");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
                PreparedStatement ps = cn.prepareStatement("update video set title=? ,description=? where code=? AND email=? AND ccode=?");
                ps.setString(1,vname);
                ps.setString(2,des);
                ps.setString(3,code);
                ps.setString(4,email);
                ps.setString(5,ccode);
                
                if(ps.executeUpdate()>0){
                    response.sendRedirect("All_channel_video.jsp?code="+ccode+"&Video_Updated=1");
                }
                else{
                       response.sendRedirect("All_channel_video.jsp?code="+ccode+"&again=1");
                }
                
            }
            catch(Exception er){
                out.print(er.getMessage());
            }
        }
    }
}
    
    
%>