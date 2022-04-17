<%-- 
    Document   : load_more
    Created on : 9 Apr, 2022, 8:33:00 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 <%
  if(request.getParameter("code")!=null && request.getParameter("num")!=null){
      String code = request.getParameter("code");
       
       try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
                 Statement st = cn.createStatement();
                  int id  = Integer.parseInt(request.getParameter("num"));
      
                 int start =id*3 ;
                    int flag=0;
                 ResultSet rs = st.executeQuery("select * from video where ccode='"+code+"' AND status=0 limit "+start+",3");
                 while(rs.next()){
                     flag++;
                     %>
                      <div class="col-sm-4 video-block" data-aos="fade-up" id="user">	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr>
                                        <td data-aos="fade-right"><a href="play_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=rs.getString("ccode")%>"><img data-aos="fade-right" src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                            <td><h5 data-aos="fade-right"><strong><%=rs.getString("title")%></strong></h5></td>
                                       </tr>
                                    </table>
                         </div>
                     <%
                 }
                 if(flag==3){
                     %>
           <div class="col-sm-12"><center><button class="w3-button w3-red" id="<%=(id+1)%>">Load More</button></center><br></div>

                     <%
                 }
                 
             }
             catch(Exception er){
                 out.print(er.getMessage());
             }
       
            
            
              




           
  }
 %>
 
