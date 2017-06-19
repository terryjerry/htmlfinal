<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
    <title>register</title>
    <link rel="stylesheet" href="main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
      function verify(){
          var txt = $("#account").val();
          $.post("ckeckrepeat.jsp", {account: txt}, function(response){
              document.getElementById("re").innerHTML = response;
          });
      }
    </script>
  </head>


  <body style="background-image: url('https://wallpaperscraft.com/image/lines_figures_light_geometric_73358_1920x1080.jpg'); background-size:cover">
    <div align="center">
      <form action="checkregister.jsp" method="post" class="form-container">
        <div class="form-title">帳號</div>
        <input class="form-field" type="text" id="account" name="account" placeholder="請輸入學號" onblur="verify()" required/>
        <span id="re"></span>
        <div class="form-title">密碼</div>
        <input class="form-field" type="password" name="password" name="password" placeholder="請輸入密碼" required/><br/>
        <div class="form-title">姓名</div>
        <input class="form-field" type="text" name="username" placeholder="請輸入密碼" required/><br/>
        <div class="form-title">生日</div>
        <input class="form-field" type="date" name="birthday" required/><br/>
        <div class="form-title">備註</div>
        <textarea class="form-field" name="memo" placeholder="請輸入備註"></textarea><br/><br/>
        <input class="submit-button" type="submit" value="註冊"/>
      </form>
   </div>
  </body>
</html>
