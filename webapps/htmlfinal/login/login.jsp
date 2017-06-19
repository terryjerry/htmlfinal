<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>login</title>
        <link rel="stylesheet" href="main.css"/>
        <style>
            .back_img {
                background-image: url('https://wallpaperscraft.com/image/lines_figures_light_geometric_73358_1920x1080.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                width: 100%;
                height: 100%;
            }

        </style>
    </head>
    <body class="back_img">
        <div align="center">
            <form action="checklogin.jsp" method="post" class="form-container">
                <div class="form-title">
                    <h2>選課小幫手</h2>
                </div>
                <div class="form-title">帳號</div>
                <input class="form-field" type="text" name="account" required/><br/>
                <div class="form-title">密碼</div>
                <input class="form-field" type="password" name="password" required/><br/>
                <input class="submit-button" type="submit" value="登入"/>
                <a href="register.jsp"><input class="submit-button" type="button" value="註冊"/></a>
            </form>
        </div>
    </body>
</html>
