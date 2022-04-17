<%-- 
    Document   : channel_image
    Created on : 25 Feb, 2022, 11:59:10 AM
    Author     : Genius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
if(request.getParameter("code")==null){
    response.sendRedirect("index.jsp?code_err=1");
}
else{
    String code = request.getParameter("code");
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
	   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    
    
	  <script>
	   
	  
	  </script>
	  <style>
	  
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
                    <a href="dashboard.jsp"> <i class="fa fa-home"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</strong></a>  
                </li> 
                <li>
                    <a href="dashboard.jsp"> <i class="fa fa-video-camera"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Video</strong></a>  
                </li> 
                <li>
                    <a href="logout.jsp"> <i class="fa fa-sign-out"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</strong></a>  
                </li> 
                    </ul>
                 
                 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                         
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">About</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Portfolio</a>
                </li>
                <li>
                    <a href="#">Contact</a>
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
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                             
                            <li class="nav-item">
                                <a class="nav-link" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
  <div class="row" >
       <div class="col-sm-2"></div>
       <div class="col-sm-8 w3-card">	   
		 <form method="post" ACTION="ChannelImageUploadProcess.jsp?code=<%=code%>" name="uploadForm" ENCTYPE='multipart/form-data'>

				File Upload:
				<input type="file" name="uploadFile" class="form-control"><br><br>

				<input type="submit" name="Submit" value="Submit"class="btn btn-danger">
          
 
         </form>
        </div>	
       <div class="col-sm-2"></div>
		
             
  
  </div>
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:blue;">
                        <div>
	        <center> <h3>Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black">Privacy Policy</a></center>
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
%>
