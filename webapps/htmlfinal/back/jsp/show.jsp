<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*,org.json.*,java.util.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="team5"/>
  <jsp:setProperty property="user" name="database" value="team5"/>
  <jsp:setProperty property="password" name="database" value="NCHUTeam5!"/>
  <%-- <jsp:setProperty property="ip" name="database" value="127.0.0.1"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029026"/>
  <jsp:setProperty property="user" name="database" value="root"/>
  <jsp:setProperty property="password" name="database" value=""/> --%>
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
  String a,b,c,d,e,f,g,h,i,j,k = "";
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
    for(int z = 0; z < al.size(); z++) {
      sql = "select * from lesson where 選課號碼='" + al.get(z) + "' and 類別='" + option1 + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs.next()) {
        a = rs.getString("年級");
        b = rs.getString("類別");
        c = rs.getString("領域");
        d = rs.getString("選課號碼");
        e = rs.getString("科目名稱");
        f = rs.getString("學分");
        g = rs.getString("上課星期");
        h = rs.getString("上課節次");
        i = rs.getString("教室");
        j = rs.getString("老師");
        k = rs.getString("開課人數");
        JSONObject y = new JSONObject();
        y.put("年級",a);
        y.put("類別",b);
        y.put("領域",c);
        y.put("選課號碼",d);
        y.put("科目名稱",e);
        y.put("學分",f);
        y.put("上課星期",g);
        y.put("上課節次",h);
        y.put("教室",i);
        y.put("老師",j);
        y.put("開課人數",k);
        json.put(y);
      }
    }
  }else {
    if(!(week.equals("無")) && !(classnode.equals("無"))) {
      sql = "select * from lesson where 上課星期='" + week + "' and 類別='" + option1 + "'";
      database.query(sql);
      rs = database.getRS();
      if(rs != null){
        while(rs.next()){
          h = rs.getString("上課節次");
          if(h.indexOf(classnode) != -1) {
            a = rs.getString("年級");
            b = rs.getString("類別");
            c = rs.getString("領域");
            d = rs.getString("選課號碼");
            e = rs.getString("科目名稱");
            f = rs.getString("學分");
            g = rs.getString("上課星期");
            i = rs.getString("教室");
            j = rs.getString("老師");
            k = rs.getString("開課人數");
            JSONObject y = new JSONObject();
            y.put("年級",a);
            y.put("類別",b);
            y.put("領域",c);
            y.put("選課號碼",d);
            y.put("科目名稱",e);
            y.put("學分",f);
            y.put("上課星期",g);
            y.put("上課節次",h);
            y.put("教室",i);
            y.put("老師",j);
            y.put("開課人數",k);
            json.put(y);
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
          a = rs.getString("年級");
          b = rs.getString("類別");
          c = rs.getString("領域");
          d = rs.getString("選課號碼");
          e = rs.getString("科目名稱");
          f = rs.getString("學分");
          g = rs.getString("上課星期");
          h = rs.getString("上課節次");
          i = rs.getString("教室");
          j = rs.getString("老師");
          k = rs.getString("開課人數");
          JSONObject y = new JSONObject();
          y.put("年級",a);
          y.put("類別",b);
          y.put("領域",c);
          y.put("選課號碼",d);
          y.put("科目名稱",e);
          y.put("學分",f);
          y.put("上課星期",g);
          y.put("上課節次",h);
          y.put("教室",i);
          y.put("老師",j);
          y.put("開課人數",k);
          json.put(y);
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
