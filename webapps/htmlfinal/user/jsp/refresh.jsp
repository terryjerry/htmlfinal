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
  database.connectDB();
  String account = session.getAttribute("user").toString();
  JSONArray json = new JSONArray();
  String a = "";
  String b = "";
  String c = "";
  String d = "";
  String e = "";
  String schedule = "";
  String code = "";
  String sql = "select * from test where account ='" + account + "'";
  database.query(sql);
  ResultSet rs = database.getRS();
  if(rs.next()) {
    schedule = rs.getString("schedule");
    if(schedule == null) {
      schedule = "";
    }
    for(int i = 0; i < schedule.length(); i+=4) {
      code = schedule.substring(i,i+4);
      sql = "select * from lesson where 選課號碼 ='" + code + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs.next()){
        a = rs.getString("科目名稱");
        b = rs.getString("上課星期");
        c = rs.getString("上課節次");
        d = rs.getString("老師");
        e = rs.getString("選課號碼");
        JSONObject j = new JSONObject();
        j.put("科目名稱",a);
        j.put("上課星期",b);
        j.put("上課節次",c);
        j.put("老師",d);
        j.put("選課號碼",e);
        json.put(j);
      }
    }
    if(rs != null) {
      rs.close();
      rs = null;
    }
  }
  database.closeDB();
  out.print(json);
%>
