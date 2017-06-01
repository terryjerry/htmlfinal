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
%>
<!DOCTYPE HTML>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>選課小幫手</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <!-- Semantic UI CSS -->
    <link href="semantic-ui/dist/semantic.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
      function show(){
            var txt1 = $("#option1").val();
            var txt2 = $("#option2").val();
            $.ajax({
              url: 'show.jsp',                  //the script to call to get data
              data: {option1:txt1,option2:txt2},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
              //dataType: "json",    //data format
              success: function(data)          //on recieve of reply
              {
                var data2 = JSON.parse(data);
                var content = "";

                for(var i = 0; i < data2.length; i++) {
                  var j = data2[i].選課號碼;
                  content += "<div class='column'>" +
                  "<div class='ui link card'>" +
                  "<div class='content'>" +
                  "<p class='header' id='course'>" + data2[i].科目名稱 + "</p>" +
                  "<a>" + data2[i].上課星期 + "</a>" +
                  "<a>" + data2[i].上課節次 + "</a>" +
                  "<p>" + data2[i].老師 + "</p>" +
                  "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal' data-whatever='@mdo' onclick=detail('" + j + "')>" +
                  "detail" +
                  "</button>" +
                  "</div>" +
                  "</div>" +
                  "</div>";
                }
                document.getElementById("cards").innerHTML = content;
              },
              error: function(data){
                console.log(data.responseText);
              }
            });
      }


      function detail(course) {
        var txt1 = $("#option1").val();
        var txt2 = $("#option2").val();
        var txt3 = course;
        $.ajax({
          url: 'detail.jsp',                  //the script to call to get data
          data: {option1:txt1,option2:txt2,option3:txt3},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
          //dataType: "json",    //data format
          success: function(data)          //on recieve of reply
          {
            var data2 = JSON.parse(data);
            document.getElementById("lessonname").innerHTML = data2.科目名稱;
            document.getElementById("lessoncode").innerHTML = data2.選課號碼;
            document.getElementById("lessontime").innerHTML = data2.上課星期 + data2.上課節次;
            document.getElementById("lessonplace").innerHTML = data2.教室;
            document.getElementById("lessonteacher").innerHTML = data2.老師;
          },
          error: function(data){
            console.log(data.responseText);
          }
        });
      }
    </script>
</head>

<body>
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="navbar-header">
    <p style="font-size:30px" id="e04">選課小幫手</p>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li>
        <a href="#" style="font-size: 25px;">登出</i></a>
      </li>
  </div>
  </nav>

  <div class="container">
    <div class="main ui padded grid">
      <div id="left-sidebar">
        <form action="" type="post">
          <SELECT name="option1" id="option1" size=1>
		        <OPTION value = "必修" selected>必修</OPTION>
		        <OPTION value = "選修">選修</OPTION>
		        <OPTION value = "通識">通識</OPTION>
		        <OPTION value = "體育">體育</OPTION>
	        </SELECT>
          <SELECT name="option2" id="option2" size=1>
		        <OPTION value = "資訊管理學系學士班" selected>資訊管理學系學士班</OPTION>
		        <OPTION value = "機械工程學系學士班A">機械工程學系學士班A</OPTION>
	        </SELECT>
          <input type="button" value="送出" onclick="show()"/>
        </form>

        <div id="cards"></div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" style="display: none;">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="exampleModalLabel1">課程</h4>
              </div>
              <div class="modal-body">
                  <form action="" method="post">
                      <div class="form-group">
                          <label class="control-label">科目</label>
                          <p id="lessonname"></p>
                      </div>
                      <div class="form-group">
                          <label class="control-label">課號</label>
                          <p id="lessoncode"></p>
                      </div>
                      <div class="form-group">
                          <label class="control-label">時間</label>
                          <p id="lessontime"></p>
                      </div>
                      <div class="form-group">
                          <label class="control-label">教室</label>
                          <p id="lessonplace"></p>
                      </div>
                      <div class="form-group">
                          <label class="control-label">老師</label>
                          <p id="lessonteacher"></p>
                      </div>
                      <div class="form-group">
                          <label class="control-label">ptt內容</label>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </div>


  <!-- jQuery -->
  <script src="js/jquery.js"></script>

  <!-- Bootstrap Core JavaScript -->

</body>

</html>
