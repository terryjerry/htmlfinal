<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title></title>
        <link rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <%
        database.query("select * from 資訊管理學系學士班");
        ResultSet rs = database.getRS();
        if(rs != null){
          while(rs.next()){
            String a = rs.getString("必選別");
            String b = rs.getString("選課號碼");
            String c = rs.getString("科目名稱");
            String d = rs.getString("上課星期");
            String e = rs.getString("上課節次");
            String f = rs.getString("開課人數");
        %>
          <p><%=a%></p>
          <p><%=b%></p>
          <p><%=c%></p>

        <%}
        }else{
          %><p>幹</p><%
        }
        %>
    </body>
</html>
