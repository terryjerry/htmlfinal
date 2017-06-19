<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="team5"/>
  <jsp:setProperty property="user" name="database" value="team5"/>
  <jsp:setProperty property="password" name="database" value="NCHUTeam5!"/>
</jsp:useBean>
<%
  database.connectDB();
  request.setCharacterEncoding("UTF-8");
  String category = request.getParameter("a");
  String department = request.getParameter("b");
  String cancelall = request.getParameter("c");
  String code = request.getParameter("d");
  // String category = "必修";
  // String department = "資訊管理學系學士班";
  // String cancelall = "0";
  // String code = "1234";
  String sql = "";
  String re = "刪除成功";
  if(cancelall.equals("1") || category.equals("通識") || category.equals("體育")) {
    sql = "delete from lesson where 選課號碼 = '" + code + "'";
  }else {
    sql = "delete from " + department + " where 選課號碼 = '" + code + "'";
  }
  database.deleteData(sql);
  database.closeDB();
  out.print(re);
%>
