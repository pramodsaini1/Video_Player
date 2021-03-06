<%-- 
    Document   : dashboard
    Created on : 24 Feb, 2022, 9:13:53 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
    try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
       Statement st = cn.createStatement();
       ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
       if(rs.next()){
           %>
            

<html>
      <head>
          <title>My Video Player</title>
	  </head>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="style.css">
 
     
    <script src="script.js"></script>
    
    
    
    
	  <script>
             
	    $(document).on("click",".fa.fa-edit",function(){
                  var code = $(this).attr("id");
                   var msg   = $("#c"+code).text();
                   
                  $("#c"+code).html("<input type='text' class='form-control' value='"+msg+"' id='d"+code+"'>");
                   $(this).attr("class","fa fa-save");
                   $(this).css("color","blue");
                
                }); 
            
                $(document).on("click",".fa.fa-trash",function(){
                  var code = $(this).attr("id");
                   $.post(
                      "channel_delete.jsp",{code:code},function(data){
                         if(data.trim()=="success"){
                             $("#r"+code).fadeOut(1000);
                         }
                      } 
                   );
                  
              }); 
               
               
           
             $(document).on("click",".fa.fa-save",function(){
                 var code = $(this).attr("id");
                 var msg = $("#d"+code).val();
                 $.post(
                      "update_channel.jsp",{code:code,msg:msg},function(data){
                           $("#c"+code).html(msg);
                            $("#"+code).attr("class","fa fa-edit");
                             $(this).css("color","#04ddeo");
                      }
                  );
             });
             
	  
	  </script>
	   
	  <body>




<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Video Player</h3>
            </div>

            <ul class="list-unstyled components">
                <img src="profile/<%=rs.getString("code")%>.jpg" style="width:200px;height: 200px;"class="img-fluid rounded-circle thumbnails">
                <p><strong><%=rs.getString("username")%></strong></p>
                <li>
                    <a href="index.jsp"> <i class="fa fa-home"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home</strong></a>  
                </li>
                 
                <li>
                    <a href="history.jsp"> <i class="fa fa-history"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;History</strong></a>  
                </li>
                <li>
                    <a href="your_videos.jsp"> <i class="fa fa-video-camera"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Videos</strong></a>  
                </li>
                 
                <li>
                    <a href="liked_video.jsp"> <i class="fa fa-thumbs-up"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Liked Videos</strong></a>  
                </li>
                <li>
                    <a href="fav_video.jsp"> <i class="fa fa-heart"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorite Videos</strong></a>  
                </li>
                <%
             
                     if(email!=null){
                          %>
                          <li>
                             <a href="user_profile.jsp"> <i class="fa fa-user"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View Profile</strong></a>  
                         </li>
                          <%
                      }  
                        
                    
                    %>
                <li>
                    <a href="#"> <i class="fa fa-cog"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Setting</strong></a>  
                </li>
                <li>
                    <a href="#"> <i class="fa fa-support"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Help</strong></a>  
                </li>
                <%
            if(email!=null){
                          %>
                          <li>
                             <a href="user_profile.jsp"> <i class="fa fa-user"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View Profile</strong></a>  
                         </li>
                          <%
                      }  
                        
                    
                    %>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                 </li>
                <li>
                 </li>
            </ul>
        </nav>

		
		<!-- Model -->
		
		 


 
                
<!-- Registration--->
 

<! End Registration-->
        <!-- Page Content  -->
        <div id="content" style="background-color:white;">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fa fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <%
                          if(email==null){
                            %>
                            <li class="nav-item active">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal"><strong>Login</strong></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#register"><strong>Registration</strong></a>
                            </li>
                            <%
                             }
                             else{
                                 %>
                                 <li class="nav-item">
                                     <a class="nav-link" href="logout.jsp"><i class="fa fa-sign-out"></i><strong>Logout</strong></a>
                            </li>
                                 <%
                             }
                            %>   
                        </ul>     
                    </div>
                </div>
            </nav>
<div class="container-fluid">
  <div class="row" >
       <div class="col-sm-12 w3-card">
             <div class="col-sm-12"><center><h2 style="color:green"><strong>Add Channel</strong></h2></center></div>
          <form method="post" action="add_channel.jsp">
              <strong>Channel Name:</strong>
              <input type="text" name="cname" class="form-control" required><br><br>
              <strong>Channel Category:</strong>
              <select name="category" class="form-control">
                  <option value="Vehicles">Vehicles</option> 
                  <option value="Music">Music</option> 
                  <option value="Pets & Animals">Pets & Animals</option> 
                  <option value=" Travel & Events">Travel & Events</option> 
                  <option value="Gaming">Gaming</option> 
                  <option value="People & Blog">People & Blog</option> 
                  <option value=" Comedy">Comedy</option> 
                  <option value="Entertainment">Entertainment</option> 
                  <option value="News & Politics">News & Politics</option> 
                  <option value="Education">Education</option> 
                  <option value="Science & Technology">Science & Technology</option> 
 
              </select><br><br>
              
              <center> <input type="submit" value="Submit" class="btn btn-primary"></center>
              
              
          </form>
          
          
      </div>
       <div class="col-sm-12 w3-card">
           <div class="col-sm-12"></div>
                      <div class="col-sm-12"></div>
           <div class="col-sm-12"></div>

                 <%
               try{
                   Class.forName("com.mysql.jdbc.Driver");
                    Statement st1 = cn.createStatement();
                    out.print("<table class='table table-borderless w3-card'>");
                    ResultSet rs1 = st1.executeQuery("select * from channel where email='"+email+"' AND status=0");
                    while(rs1.next()){
                        %>
                        <tr id="r<%=rs1.getString("code")%>">
                            <td><img src="profile/<%out.print(rs1.getString("code"));%>.jpg" style="width:150px;height:150px;" class="img-fluid thumbnails "></td>
                            <td id="c<%=rs1.getString("code")%>"><strong><%out.print(rs1.getString("cname"));%></strong></td>
                            <td><button class="btn btn-success"><a href="All_channel_video.jsp?code=<%=rs1.getString("code")%>"><i class="fa fa-eye"></i> View</a></button> </td>
                            <td><i class="fa fa-edit" style="font-size:25px;color:blue;cursor:pointer;" id="<%=rs1.getString("code")%>"></i></td>
                            <td><i class="fa fa-trash" style="font-size:25px;color:red;cursor:pointer;" id="<%=rs1.getString("code")%>"></i></td>                           
                           <td><button class="btn btn-primary"><a href="channel_video_add.jsp?code=<%=rs1.getString("code")%>"><i class="fa fa-plus"></i>Add Video</a></button></td>
                            
                        </tr>
                        
                        <%
                    }
                    out.print("</table>");
               }
               catch(Exception em){
                   out.print(em.getMessage());
               }
               %>
               
      </div>
 		
             
  
  </div>
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:#A7A2A2;">
                        <div>
	        <center> <h3 style="color:white;">Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:white">Privacy Policy</a></center>
         <center><br><h3>YouTube ?? 2022</h3></center><br></div></div>
		        <center> <p style="color:white;">Made with ? By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p></center>

  
  
                    </div>
          </footer>            
         </div>
    </div>
	</body>
	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://unpkg.com/aos@2.3.0/dist/aos.js'></script>
  
      <script id="rendered-js" >
AOS.init({
  duration: 1200 });
//# sourceURL=pen.js
    </script>

  

  <script src="https://static.codepen.io/assets/editor/iframe/iframeRefreshCSS-e03f509ba0a671350b4b363ff105b2eb009850f34a2b4deaadaa63ed5d970b37.js"></script>
  
</html>

           
           
           <%
       }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
    
    
%>
