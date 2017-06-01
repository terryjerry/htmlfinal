<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*,org.json.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029026"/>
  <jsp:setProperty property="user" name="database" value="4104029026"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029026!"/>
</jsp:useBean>
<%
  database.connectDB();
  request.setCharacterEncoding("UTF-8");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String a = "";
        String b = "";
        String c = "";
        String d = "";
        String e = "";
        String f = "";
        JSONArray json = new JSONArray();
        if(option1.equals("必修") || option1.equals("選修")) {
          String sql = "select * from " + option2 + " where 必選別='" + option1 + "'";
          database.query(sql);
          ResultSet rs = database.getRS();
          if(rs != null){
            while(rs.next()){
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
          out.print(json);
        }
%>
