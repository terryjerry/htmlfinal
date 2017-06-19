<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String acc = session.getAttribute("user").toString();
  if(acc.equals("manage")) {
    response.sendRedirect("/htmlfinal/back/index.jsp");
  }else {
    response.sendRedirect("/htmlfinal/user/index.jsp");
  }
%>
