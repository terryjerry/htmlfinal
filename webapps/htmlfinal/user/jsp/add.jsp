<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*,org.json.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="team5"/>
  <jsp:setProperty property="user" name="database" value="team5"/>
  <jsp:setProperty property="password" name="database" value="NCHUTeam5!"/>
</jsp:useBean>
<%
  request.setCharacterEncoding("UTF-8");
  String account = session.getAttribute("user").toString();
  database.connectDB();
  String code = request.getParameter("code");
  String sql = "select * from test where account ='" + account + "'";
  database.query(sql);
  ResultSet rs = database.getRS();
  if(rs.next()){
    String schedule = rs.getString("schedule");
    if(schedule == null) {
      schedule = "";
    }
    schedule += code;
    database.connectDB();
    sql = "update test set schedule = '" + schedule + "' where account = '" + account + "'";
    database.editData(sql);
    if(rs != null) {
      rs.close();
      rs = null;
    }
    database.closeDB();
    out.print(schedule);
  }
%>
