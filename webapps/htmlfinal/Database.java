package com.database;
import java.sql.*;
public class Database{
  private Connection con = null;
  private ResultSet rs = null;
  private Statement stmt = null;
  private PreparedStatement ps = null;
  private String ip = "";
  private String port = "";
  private String url = "";
  private String db = "";
  private String user = "";
  private String password = "";
  private String driver = "com.mysql.jdbc.Driver";

  public Database(){
  }

  public void connectDB(){
    try{
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url, user, password);
      stmt = con.createStatement();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void closeDB() {
    try {
      if(stmt != null) {
        stmt.close();
      }
      if(con != null) {
        con.close();
      }
      if(rs != null) {
        rs.close();
      }
      if(ps != null) {
        ps.close();
      }
    }catch(Exception ex){
      System.out.println(ex);
    }
  }

  public void query(String sql){
    try{
      rs = stmt.executeQuery(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void insertData(String category, String lesson, String grade, String department, String field, String codenumber, String points, String lessonweek, String lessonnode, String classroom, String teacher, String people, int haslesson){
    try{
      String sql = "";
      int a = 0;
      if(haslesson == 0) {
        sql = "insert into lesson (年級, 類別, 領域, 選課號碼, 科目名稱, 學分, 上課星期, 上課節次, 教室, 老師, 開課人數) values(?,?,?,?,?,?,?,?,?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, grade);
        ps.setString(2, category);
        ps.setString(3, field);
        ps.setString(4, codenumber);
        ps.setString(5, lesson);
        ps.setString(6, points);
        ps.setString(7, lessonweek);
        ps.setString(8, lessonnode);
        ps.setString(9, classroom);
        ps.setString(10, teacher);
        ps.setString(11, people);
        a = ps.executeUpdate();
      }
      if(category.equals("必修") || category.equals("選修")) {
        sql = "insert into " + department + " (選課號碼) values(?)";
      }
      ps = con.prepareStatement(sql);
      ps.setString(1, codenumber);
      a = ps.executeUpdate();
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void editData(String sql){
    try{
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void editlesson(String sql) {
    try {
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public void deleteData(String sql){
    try{
      int a = stmt.executeUpdate(sql);
    }catch(Exception ex){
      System.out.println(ex);
    }
  }
  public Connection getCon(){
    return con;
  }
  public ResultSet getRS(){
    return rs;
  }
  public void setIp(String ip){
    this.ip = ip;
  }
  public void setPort(String port){
    this.port = port;
  }
  public void setUrl(String ip, String port){
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName){
    this.db = dbName;
  }
  public void setUser(String username){
    this.user = username;
  }
  public void setPassword(String password){
    this.password = password;
  }
  public void setDriver(String driver){
    this.driver = driver;
  }
}
