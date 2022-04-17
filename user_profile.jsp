<%-- 
    Document   : user_profile
    Created on : 11 Apr, 2022, 4:52:37 PM
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
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://use.fontawesome.com/09901d9403.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
     
	  <style>
	   .col-sm-4.video-block{
            transform: scale(.99);
            transition: .33s;
        }
         .col-sm-4.video-block:hover{
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
                <p> Video Player</p>
                 <li>
                    <a href="index.jsp"> <i class="fa fa-home"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home</strong></a>  
                </li>
                <li>
                    <a href="dashboard.jsp"> <i class="fa fa-dashboard"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</strong></a>  
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
                    <a href="fav_video.jsp"> <i class="fa fa-heart"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorite Videos</strong></a>  
                </li>
                <li>
                    <a href="#"> <i class="fa fa-cog"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Setting</strong></a>  
                </li>
                <li>
                    <a href="#"> <i class="fa fa-support"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Help</strong></a>  
                </li>
                 
                
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
                    </button>                            <li class="nav-item">


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
                                <a class="nav-link" href="logout.jsp" ><strong>Logout</strong></a>
                            </li>
                                 <%
                             }
                            %>                        </ul>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6 w3-card">
            <img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid">
        </div>
        <div class="col-sm-6 w3-card">
            <table class="table table-borderless">
                <tr><td><strong><h3>User Name :</h3></strong></td><td><strong><h3><%=rs.getString("username")%></h3></strong></td></tr>
                <tr><td><strong><h3>Email Id :</h3></strong></td><td><strong><h3><%=rs.getString("email")%></h3></strong></td></tr>
                <tr><td><strong><h3>Gender :</h3></strong></td><td><strong><h3><%=rs.getString("gender")%></h3></strong></td></tr>
                <tr><td><strong><h3>DOB :</h3></strong></td><td><strong><h3><%=rs.getString("dob")%></h3></strong></td></tr>
                <tr><td><strong><h3>Country :</h3></strong></td><td><strong><h3><%=rs.getString("country")%></h3></strong></td></tr>
            </table>
        </div>
        
    </div>
  
</div>
   <div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" style="color:white;background-color:blue">
        <h4 class="modal-title">Login</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <form method="post" action="check.jsp">
		  <label>Email :</label>
		  <input type="email" name="email" class="form-control"><br>
		  <label>Password:</label>
		  <input type="password" name="pass" class="form-control"><br>
		  
                  <input type="submit" value="Submit" class="btn btn-success"> 
         </form> 
       </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
     </div>
  </div>
</div>


 
                
<!-- Registration--->
<div class="modal" id="register">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" style="color:white;background-color:green">
        <h4 class="modal-title">Registration</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <form method="post" action="registration.jsp">
		  <label>User Name :</label>
		  <input type="text" name="user" class="form-control"><br>
                  <label>Email - Id :</label>
		  <input type="email" name="email" class="form-control"><br>
		  <label>Password:</label>
		  <input type="password" name="pass" class="form-control"><br>
                  <label>Gender :</label>
                  <input type="radio" name="gender"  value="Male"required>Male <input  type="radio" name="gender" value="Female"required>Female<br>
                  <label>Dob:</label>
                  <input type="date" name="dob" class="form-control" required><br>
                  <label>Country:</label>
                  <select name="country" class="form-control">
                      <option value="India">India</option>
                      <option value="Australia">Australia</option>
                      <option value="England">England</option>
                      <option value="Sri Lanka">Sri Lanka</option>
                      <option value="Pakisthan">Pakisthan</option>
                      <option value="Mexico"> Mexico</option>
                  </select><br>
                  <input type="submit" value="Submit" class="btn btn-warning">
         </form> 
       </div>

      <!-- Modal footer -->
      <div class="modal-footer">
          
         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
     </div>
  </div>
</div>

<footer class="footer">
            <div class="container-fluid" style="background-color:#7386D5;">
                        <div>
	        <center> <h3 style="color:white;">Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:white;">Privacy Policy</a></center>
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
