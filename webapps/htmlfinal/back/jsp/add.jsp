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
  String l = request.getParameter("l");
  // String a = "必修";
  // String b = "1234";
  // String c = "1";
  // String d = "資訊管理學系學士班";
  // String e = "人文";
  // String f = "5678";
  // String g = "3";
  // String h = "3";
  // String i = "456";
  // String j = "888";
  // String k = "999";
  // String l = "10";
  int haslesson = 1;
  String sql = "";
  String re = null;
  sql = "select * from lesson where 選課號碼 ='" + f + "'";
  database.query(sql);
  ResultSet rs = database.getRS();
  if(rs.next()){
    if(a.equals("必修") || a.equals("選修")) {
      sql = "select * from " + d + " where 選課號碼 ='" + f + "'";
    }
    database.query(sql);
    rs = database.getRS();
    if(rs.next()) {
      re = "已有該課程";
      out.print(re);
    }else {
      database.insertData(a,b,c,d,e,f,g,h,i,j,k,l,haslesson);
      database.closeDB();
      re = "成功加入";
      out.print(re);
    }
  }else {
    haslesson = 0;
    database.insertData(a,b,c,d,e,f,g,h,i,j,k,l,haslesson);
    database.closeDB();
    re = "成功加入";
    out.print(re);
  }
  if(rs != null) {
    rs.close();
    rs = null;
  }
%>
