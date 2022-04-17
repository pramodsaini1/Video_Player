<%-- 
    Document   : history
    Created on : 17 Mar, 2022, 11:50:04 AM
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

     
    <script src="script.js"></script>
    
    
	  <script>
	   $(document).ready(function(){
               $(".fa.fa-trash").click(function(){
                   var code=$(this).attr("rel");
                   $.post(
                       "delete_history.jsp",{code:code},function(data){
                          if(data.trim()=="success"){
                              $("#r-"+code).fadeOut(1000);
                          }
                       }
                    );
                      
               });
               
               
           });
	  
	  </script>
	  <style>
	   .video-block{
            transform: scale(.99);
            transition: .33s;
        }
         .video-block:hover{
            transform: scale(1.1);
            z-index: 99;
        }
	  </style>
	  <body>




<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Video Player</h3>
            </div>

            <ul class="list-unstyled components">
                <p>My Video Player</p>
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
                    <a href="#"> <i class="fa fa-history"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Watch Later</strong></a>  
                </li>
                <li>
                    <a href="liked_video.jsp"> <i class="fa fa-thumbs-up"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Liked Videos</strong></a>
                </li>
                <li>
                    <a href="fav_video.jsp"><i   class="fa fa-heart"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorite Videos</strong></a> 
                </li>
                   <li>
                    <a href="subscribe_channel.jsp"><i   class="fa fa-envelope"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subscriptions</strong></a> 
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
      <h3 class="w3-card w3-blue"><strong><center>Your History</center></strong></h3>
  <div class="row" >
      <%
         Statement st1 = cn.createStatement();
         ResultSet rs1 = st1.executeQuery("select * from history  where email='"+email+"' order by rand() ");
         while(rs1.next()){
             Statement st2 = cn.createStatement();
             ResultSet rs2 = st2.executeQuery("select * from video where code='"+rs1.getString("vcode")+"'");
             if(rs2.next()){
                 %>
                 <div class="col-sm-4 w3-card video-block" id="r-<%=rs1.getString("vcode")%>">
                              <table class="table table-borderless">
                                  <tr  >
                                      <td><a href="play_video.jsp?code=<%=rs2.getString("code")%>&ccode=<%=rs2.getString("ccode")%>"><img src="profile/<%=rs2.getString("code")%>.jpg" class="img-fluid"></a></td>
                                  </tr>
                                  <tr  >
                                      <td><strong><%=rs2.getString("title")%></strong></td><td><i   style="float:right;cursor:pointer;color:red;font-size: 25px;"class="fa fa-trash" rel="<%=rs1.getString("vcode")%>"></i></td>
                                  </tr>
                              </table>
                                      
                </div>
                 
                 
                 <%
             }
         }
        
          
       %>
  </div>
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:#7386D5;">
                        <div>
	        <center> <h3 style="color:white">Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:white">Privacy Policy</a></center>
         <center><br><h3>YouTube © 2022</h3></center><br></div></div>
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
     
    
     