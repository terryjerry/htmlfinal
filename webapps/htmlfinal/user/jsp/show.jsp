<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*,org.json.*,java.util.*" %>
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
  String option1 = request.getParameter("option1");
  String option2 = request.getParameter("option2");
  String week = request.getParameter("week");
  String classnode = request.getParameter("classnode");
  // String option1 = "必修";
  // String option2 = "資訊管理學系學士班";
  // String week = "1";
  // String classnode = "12";
  String a = "";
  String b = "";
  String c = "";
  String d = "";
  String e = "";
  String f = "";
  String sql = "";
  ResultSet rs = null;
  JSONArray json = new JSONArray();
  ArrayList al = new ArrayList();
  if(option1.equals("必修") || option1.equals("選修")) {
    sql = "select * from " + option2;
    database.query(sql);
    rs = database.getRS();
    while(rs.next()){
      al.add(rs.getString("選課號碼"));
    }
    for(int i = 0; i < al.size(); i++) {
      sql = "select * from lesson where 選課號碼='" + al.get(i) + "' and 類別='" + option1 + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs.next()) {
        a = rs.getString("年級");
        b = rs.getString("科目名稱");
        c = rs.getString("上課星期");
        d = rs.getString("上課節次");
        e = rs.getString("老師");
        f = rs.getString("選課號碼");
        JSONObject j = new JSONObject();
        j.put("年級",a);
        j.put("科目名稱",b);
        j.put("上課星期",c);
        j.put("上課節次",d);
        j.put("老師",e);
        j.put("選課號碼",f);
        json.put(j);
      }
    }
  }else if(option1.equals("體育")) {
    if(!(week.equals("無")) && !(classnode.equals("無"))) {
      sql = "select * from lesson where 上課星期='" + week + "' and 類別='" + option1 + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs != null){
        while(rs.next()){
          d = rs.getString("上課節次");
          if(d.indexOf(classnode) != -1) {
            b = rs.getString("科目名稱");
            c = rs.getString("上課星期");
            e = rs.getString("老師");
            f = rs.getString("選課號碼");
            JSONObject j = new JSONObject();
            j.put("科目名稱",b);
            j.put("上課星期",c);
            j.put("上課節次",d);
            j.put("老師",e);
            j.put("選課號碼",f);
            json.put(j);
          }
        }
      }
    }else {
      if(week.equals("無")) {
        sql = "select * from lesson where 類別='" + option1 + "'";
      }else if(classnode.equals("無")) {
        sql = "select * from lesson where 上課星期='" + week + "' and 類別='" + option1 + "'";
      }
      database.query(sql);
      rs = database.getRS();
      if(rs != null){
        while(rs.next()){
          b = rs.getString("科目名稱");
          c = rs.getString("上課星期");
          d = rs.getString("上課節次");
          e = rs.getString("老師");
          f = rs.getString("選課號碼");
          JSONObject j = new JSONObject();
          j.put("科目名稱",b);
          j.put("上課星期",c);
          j.put("上課節次",d);
          j.put("老師",e);
          j.put("選課號碼",f);
          json.put(j);
        }
      }
    }
  }else {
    if(!(week.equals("無")) && !(classnode.equals("無"))) {
      sql = "select * from lesson where 上課星期='" + week + "' and 類別='" + option1 + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs != null){
        while(rs.next()){
          d = rs.getString("上課節次");
          if(d.indexOf(classnode) != -1) {
            a = rs.getString("領域");
            b = rs.getString("科目名稱");
            c = rs.getString("上課星期");
            e = rs.getString("老師");
            f = rs.getString("選課號碼");
            JSONObject j = new JSONObject();
            j.put("領域",a);
            j.put("科目名稱",b);
            j.put("上課星期",c);
            j.put("上課節次",d);
            j.put("老師",e);
            j.put("選課號碼",f);
            json.put(j);
          }
        }
      }
    }else {
      if(week.equals("無")) {
        sql = "select * from lesson where 類別='" + option1 + "'";
      }else if(classnode.equals("無")) {
        sql = "select * from lesson where 上課星期='" + week + "' and 類別='" + option1 + "'";
      }
      database.query(sql);
      rs = database.getRS();
      if(rs != null){
        while(rs.next()){
          a = rs.getString("領域");
          b = rs.getString("科目名稱");
          c = rs.getString("上課星期");
          d = rs.getString("上課節次");
          e = rs.getString("老師");
          f = rs.getString("選課號碼");
          JSONObject j = new JSONObject();
          j.put("領域",a);
          j.put("科目名稱",b);
          j.put("上課星期",c);
          j.put("上課節次",d);
          j.put("老師",e);
          j.put("選課號碼",f);
          json.put(j);
        }
      }
    }
  }
  if(rs != null) {
    rs.close();
    rs = null;
  }
  database.closeDB();
  out.print(json);
%>
