<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*"%>
<%
  String account = request.getParameter("account");
  String password = request.getParameter("password");
  String username = request.getParameter("username");
	String birthday = request.getParameter("birthday");
	String memo = request.getParameter("memo");
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
    String sql = "insert into test (account,password,username,birthday,memo) values(?,?,?,?,?)";
    ps = con.prepareStatement(sql);
    ps.setString(1, account);
    ps.setString(2, password);
    ps.setString(3, username);
    ps.setString(4, birthday);
    ps.setString(5, memo);
    int a = ps.executeUpdate();
    session.setAttribute("user", account);
    out.println(account + "註冊成功，2秒後跳轉至主化面");
    if(rs != null) {
      rs.close();
    }
    if(ps != null) {
      ps.close();
    }
    if(con != null) {
      con.close();
    }
    response.setHeader("Refresh","2; URL=/htmlfinal/user/index.jsp");
  }catch(Exception ex){
    out.println(ex.getMessage());
    response.setHeader("Refresh","2; URL=/htmlfinal/login/register.jsp");
  }
%>
