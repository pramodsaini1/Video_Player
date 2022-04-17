<%-- 
    Document   : registration
    Created on : 22 Feb, 2022, 10:06:29 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import=" java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("user").length()==0||request.getParameter("email").length()==0||request.getParameter("pass").length()==0||request.getParameter("gender").length()==0||request.getParameter("dob").length()==0||request.getParameter("country").length()==0){
    response.sendRedirect("index.jsp?empty=1");
}
else{
    String user=request.getParameter("user");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    String dob=request.getParameter("dob");
    String gender=request.getParameter("gender");
    String country=request.getParameter("country");
    
    int sn=0;
    String code = "";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select MAX(sn) from admin");
        if(rs.next()){
            sn = rs.getInt(1);
        }
        sn = sn+1;
        
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
    
    LinkedList l = new LinkedList();
      for(char ch='A' ; ch<='Z' ; ch++){
            l.add(ch+"");
      }
    for(char ch='a' ; ch<='z' ; ch++){
        l.add(ch+"");
    }
    for(char ch='0' ; ch<='9' ; ch++){
        l.add(ch+"");
    }
    Collections.shuffle(l);
    for(int i=0 ; i<6 ; i++){
        code = code+l.get(i);
    }
    code=code+"_"+sn;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/video","root","");
        PreparedStatement ps = cn.prepareStatement("insert into admin values(?,?,?,?,?,?,?,?)");
        ps.setInt(1,sn);
        ps.setString(2,code);
        ps.setString(3,user);
        ps.setString(4,email);
        ps.setString(5,pass);
        ps.setString(6,gender);
        ps.setString(7,dob);
        ps.setString(8,country);
        
        if(ps.executeUpdate()>0){
            response.sendRedirect("Image.jsp?code="+code+"&success=1");
        }
        else{
            response.sendRedirect("index.jsp?again=1");
        }
        
    }
    catch(Exception ep){
        out.print(ep.getMessage());
    }

}





%> 
