<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
  String account = request.getParameter("account");
  String user = "team5";
  String pass = "NCHUTeam5!";
  String ip = "140.120.49.205";
  // String user = "root";
  // String pass = "";
  // String ip = "127.0.0.1";
  String database = "team5";
  String url = "jdbc:mysql://" + ip + "/" + database + "?useUnicode=true&characterEncoding=utf-8";
  Connection con = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection(url,user,pass);
    String sql = "select * from test where account='" + account + "'";
    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    if(rs.next()) {
      if(rs != null) {
        rs.close();
      }
      if(ps != null) {
        ps.close();
      }
      if(con != null) {
        con.close();
      }
      out.print("帳號重複請重新輸入");
    }else {
      if(rs != null) {
        rs.close();
      }
      if(ps != null) {
        ps.close();
      }
      if(con != null) {
        con.close();
      }
      out.print("");
    }
  }catch(Exception ex){
		out.println(ex.getMessage());
    response.setHeader("Refresh","2; URL=/htmlfinal/login/register.jsp");
	}
%>
