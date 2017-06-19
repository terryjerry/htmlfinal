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
  String a = request.getParameter("a");
  String b = request.getParameter("b");
  String c = request.getParameter("c");
  String d = request.getParameter("d");
  String e = request.getParameter("e");
  String f = request.getParameter("f");
  String g = request.getParameter("g");
  String h = request.getParameter("h");
  String i = request.getParameter("i");
  String j = request.getParameter("j");
  String k = request.getParameter("k");
  // String a ="無";
  // String b ="體育";
  // String c ="無";
  // String d ="0002";
  // String e ="去死";
  // String f ="2";
  // String g ="1";
  // String h ="1";
  // String i ="1";
  // String j ="2";
  // String k ="5";
  String sql = "";
  sql = "update lesson set 年級 = '" + a + "', 領域 = '" + c + "', 科目名稱 = '"  + e + "', 學分 = '" + f + "', 上課星期 = '" + g + "', 上課節次 = '" + h + "', 教室 = '" + i + "', 老師 = '" + j + "', 開課人數 = '" + k + "' where 選課號碼 = '" + d + "'";
  database.editData(sql);
  database.closeDB();
  out.print("修改成功");
%>
