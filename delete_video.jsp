<%-- 
    Document   : delete_video
    Created on : 27 Feb, 2022, 3:33:26 PM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("code")==null&&request.getParameter("ccode")==null){
    response.sendRedirect("dashboard.jsp?code_eerr=1");
} 
else{
    String code=request.getParameter("code");
    String ccode=request.getParameter("ccode");
    String email=null ;
    int status=1;
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
            PreparedStatement ps = cn.prepareStatement("update video set status=? where code=? AND ccode=? AND email=?");
            ps.setInt(1,status);
            ps.setString(2,code);
            ps.setString(3,ccode);
            ps.setString(4,email);
            
            if(ps.executeUpdate()>0){
                response.sendRedirect("All_channel_video.jsp?code="+ccode+"&video_deleted=1");
            }
        }
        catch(Exception er){
            out.print(er.getMessage());
        }
    }
}
    
    
%>
