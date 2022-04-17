<%-- 
    Document   : index
    Created on : 22 Feb, 2022, 9:29:59 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 

<html>
      <head>
          <title>Video Player</title>
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
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

     
    <script src="script.js"></script>
    <style>
        @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #sidebarCollapse span {
        display: none;
    }
}
.fa.fa-heart{
    font-size:20px;
	cursor:pointer;

}
        
     </style>
    
	  <script>
	    $(document).ready(function(){
               $("#search").keyup(function(){
                   var txt="";
                    txt = $(this).val();
                    if(txt==""){
                        $("#record").load("new_index.jsp");
                        
                    }
                    else{
                            $.post(
                              "search.jsp",{txt:txt},function(data){

                                $("#record").html(data);
                               } 
                           );  
                    }
               }); 
                
            });
	  
	  </script>
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




<div class="wrapper"  >
        <!-- Sidebar  -->
        <nav id="sidebar" >
            <div class="sidebar-header">
                <h3>Video Player</h3>
            </div>

            <ul class="list-unstyled components">
                <p> Video Player</p>
                 
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
                    <a href="liked_video.jsp"> <i class="fa fa-thumbs-up"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Liked Videos</strong></a>  
                </li>
                <li>
                    <a href="fav_video.jsp"> <i class="fa fa-heart"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorite Videos</strong></a>  
                </li>
                     <%
                        String email=null ;
                       Cookie cp[] = request.getCookies();
                       for(int i=0;i<cp.length;i++){
                           if(cp[i].getName().equals("login")){
                               email=cp[i].getValue();
                               break;
                           }
                       }
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
                 
                
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                 </li>
                <li>
                 </li>
            </ul>
        </nav>

		
		<!-- Model -->
		
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


<! End Registration-->
        <!-- Page Content  -->
        <div id="content" style="background-color:white;">

            <nav class="navbar navbar-expand-lg navbar-light bg-light" >
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fa fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" placeholder="Search..." id="search" >
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
  <div class="row" id="record">
      <%
         try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
             Statement st = cn.createStatement();
             ResultSet rs = st.executeQuery("select * from channel where status=0");
             while(rs.next()){
                 String code=rs.getString("code");
                 %>
                 <div class="col-sm-12" style="background-color:white;">
                     <table class="table table-borderless w3-card" >
                         <tr ><td><%out.print(rs.getString("cname"));%></td><td> <a style="float:right;text-decoration: none;"   href="see_all.jsp?code=<%=rs.getString("code")%>"><b>See All</a></b> </td></tr>
                     </table>
                 </div>
                     <div class="col-sm-12"></div>
                     <%
                      Statement st1 = cn.createStatement();
                      ResultSet rs1 = st1.executeQuery("select * from video where ccode='"+code+"' AND status=0  order by rand() limit 0,3");
                      while(rs1.next()){
                          %>
                          <div class="col-sm-4 video-block" data-aos="fade-up">	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr >
                                        <td data-aos="fade-right"><a href="play_video.jsp?code=<%=rs1.getString("code")%>&ccode=<%=rs.getString("code")%>"><img data-aos="fade-right" src="profile/<%=rs1.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5 data-aos="fade-right"><strong><%=rs1.getString("title")%></strong></h5></td> 
                                       </tr>
                                    </table>
                         </div>
                          
                          <%
                      }
                 
                 
                    %>
                 <%
             }
         } 
         catch(Exception er){
             out.print(er.getMessage());
         }
          
          
          
       %>
		 
          
  
  </div>
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:#A7A2A2;">
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
