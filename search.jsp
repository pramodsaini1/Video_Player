<%-- 
    Document   : search
    Created on : 8 Apr, 2022, 10:01:22 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
  if(request.getParameter("txt")!=null){
      String txt = request.getParameter("txt");
      try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
          Statement st = cn.createStatement();
          String arr[] = txt.split(" ");
          String sql =  "select * from video where title like '%"+txt+"%' ";
          for(int i=0;i<arr.length;i++){
              sql = sql+" OR title like '%"+arr[i]+"%' AND status=0";
          }
          %>
          <div class="col-sm-12 w3-card-4"><h3><strong>Search Result</strong></h3></div>
          <%
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
          
          %>
          <div class="col-sm-4 video-block" data-aos="fade-up">	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr >
                                        <td><a href="play_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=rs.getString("ccode")%>"><img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5><strong><%=rs.getString("title")%></strong></h5></td> 
                                       </tr>
                                    </table>
                         </div>
          
          <%
           }
      }
      catch(Exception er){
          out.print(er.getMessage());
      }
  } 
%>