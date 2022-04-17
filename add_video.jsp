<%-- 
    Document   : add_video
    Created on : 26 Feb, 2022, 11:07:20 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*,java.util.Date" pageEncoding="UTF-8"%>
<%
if(request.getParameter("code")==null){
    response.sendRedirect("channel_video_add.jsp?code_error=1");
} 
else{
    String ccode=request.getParameter("code");
    if(request.getParameter("vname").length()==0||request.getParameter("des").length()==0){
        response.sendRedirect("channel_video_add.jsp?empty=1");
    }
    else{
        String vname=request.getParameter("vname");
        String des = request.getParameter("des");
        
        String email=null ;
        Cookie c[] = request.getCookies();
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
            int sn=0;
            String code="";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select Max(sn) from video");
                if(rs.next()){
                    sn=rs.getInt(1);
                }
                sn=sn+1 ;
                cn.close();
            }
            catch(Exception er){
                out.print(er.getMessage());
            }
            
            LinkedList l = new LinkedList();
            for(char p='A';p<='Z';p++){
                l.add(p+"");
            }
            for(char p='a';p<='z';p++){
                l.add(p+"");
            }
            for(char p='0';p<='9';p++){
                l.add(p+"");
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
                Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
                PreparedStatement ps = cn1.prepareStatement("insert into video values(?,?,?,?,?,?,?,?)");
                ps.setInt(1,sn);
                ps.setString(2,code);
                ps.setString(3,vname);
                ps.setString(4,des);
                ps.setString(5,email);
                ps.setString(6,ccode);
                ps.setString(7,dt);
                ps.setInt(8,status);
                
                if(ps.executeUpdate()>0){
                    response.sendRedirect("video_Image.jsp?code="+code+"&success=1");
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
}
    
    
    
%>