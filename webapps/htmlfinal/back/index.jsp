<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  if(!(session.getAttribute("user").toString().equals("manage"))) {
    response.sendRedirect("/htmlfinal/login/login.jsp");
  }
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="選課小幫手後台管理" />
    <title>後台管理</title>
    <!-- Bootstrap Core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- Semantic UI CSS -->
    <link href="semantic-ui/dist/semantic.css" rel="stylesheet" />
    <script src='/htmlfinal/back/js/execute.js'></script>
    <link rel="stylesheet" href="/htmlfinal/back/css/execute.css"/>
    <script src="/htmlfinal/back/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="/htmlfinal/back/css/sweetalert.css"/>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top background-color: blue;" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">選課小幫手</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li>
              <a href="/htmlfinal/login/logout.jsp" style="font-size: 25px;"><i class="remove user icon"></i></a>
            </li>
          </ul>
        </div>
    </nav>

    <div class="container">
        <div class="main ui padded grid">
            <div id="left-sidebar" class="sidebar column three wide">
                <div class="ui fluid center aligned vertical text menu">

                    <div class="header item" style="font-size:17px; font-family:Microsoft JhengHei; color: #367295;"><b>課程</b></div>
                    <div class="ui divider"></div>
                    <a href="index.jsp" class="item" style="font-size:17px; font-family:Microsoft JhengHei; color: white">
                        <i class="large cube icon"></i> 課程管理
                    </a>
                </div>
            </div>

            <div class="content column thirteen wide" style="height: 855px;">
                <div style="background: #fff; height: 65px; border:1px #ccc solid;border-radius:5px;">
                    <div class="top menu column">
                        <div class="ui fluid center aligned vertical text menu">
                            <div href="" class="item" style="font-size:20px; font-family:Microsoft JhengHei;">
                                <b><i class="large tag icon"></i>
                                  <a id="title_banner" style="color: #0c0c0c"> 課程管理 </a>
                                </b>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="height: 20px;"></div>
                <span>星期</span>
                <SELECT name="week" id="week" size=1>
      		        <OPTION value = "1">星期一</OPTION>
      		        <OPTION value = "2">星期二</OPTION>
      		        <OPTION value = "3">星期三</OPTION>
      		        <OPTION value = "4">星期四</OPTION>
                  <OPTION value = "5">星期五</OPTION>
                  <OPTION value = "無" selected>無</OPTION>
      	        </SELECT>
                <span>&nbsp&nbsp&nbsp節次</span>
                <SELECT name="classnode" id="classnode" size=1>
      		        <OPTION value = "1">1</OPTION>
      		        <OPTION value = "2">2</OPTION>
      		        <OPTION value = "3">3</OPTION>
      		        <OPTION value = "4">4</OPTION>
                  <OPTION value = "5">5</OPTION>
                  <OPTION value = "6">6</OPTION>
                  <OPTION value = "7">7</OPTION>
                  <OPTION value = "8">8</OPTION>
                  <OPTION value = "9">9</OPTION>
                  <OPTION value = "A">A</OPTION>
                  <OPTION value = "B">B</OPTION>
                  <OPTION value = "C">C</OPTION>
                  <OPTION value = "D">D</OPTION>
                  <OPTION value = "無" selected>無</OPTION>
      	        </SELECT>
                <span>&nbsp&nbsp&nbsp類別</span>
                <SELECT name="option1" id="option1" size=1>
      		        <OPTION value = "必修" selected>必修</OPTION>
      		        <OPTION value = "選修">選修</OPTION>
      		        <OPTION value = "通識">通識</OPTION>
      		        <OPTION value = "體育">體育</OPTION>
      	        </SELECT>
                <span>&nbsp&nbsp&nbsp系所</span>
                <SELECT name="option2" id="option2" size=1>
                  <OPTION value = "文學院">文學院</OPTION>
                  <%-- <OPTION value = "管理學院">管理學院</OPTION>
                  <OPTION value = "農業暨自然資源學院">農業暨自然資源學院</OPTION>
                  <OPTION value = "中國文學系學士班">中國文學系學士班</OPTION>
                  <OPTION value = "外國語文學系學士班">外國語文學系學士班</OPTION>
                  <OPTION value = "歷史學系學士班">歷史學系學士班</OPTION>
                  <OPTION value = "財務金融學系學士班">財務金融學系學士班</OPTION>
                  <OPTION value = "企業管理學系學士班">企業管理學系學士班</OPTION>
                  <OPTION value = "法律學系學士班">法律學系學士班</OPTION>
                  <OPTION value = "會計學系學士班">會計學系學士班</OPTION>
                  <OPTION value = "景觀與遊憩學士學位學程">景觀與遊憩學士學位學程</OPTION>
                  <OPTION value = "生物科技學士學位學程">生物科技學士學位學程</OPTION>
                  <OPTION value = "國際農企業學士學位學程">國際農企業學士學位學程</OPTION>
                  <OPTION value = "農藝學系學士班">農藝學系學士班</OPTION>
                  <OPTION value = "園藝學系學士班">園藝學系學士班</OPTION>
                  <OPTION value = "森林學系林學組學士班">森林學系林學組學士班</OPTION>
                  <OPTION value = "森林學系木材科學組學士班">森林學系木材科學組學士班</OPTION> --%>
      		        <OPTION value = "資訊管理學系學士班" selected>資訊管理學系學士班</OPTION>
      		        <OPTION value = "機械工程學系學士班A">機械工程學系學士班A</OPTION>

      	        </SELECT>
                <input type="button" value="送出" onclick="show()"/>
                <div class="row" style="height: 20px;"></div>
                <div class="ui five column grid" id="cards"></div>
            </div>
        </div>

        <div class="save-button" style="position: fixed; z-index: 999999; right: 30px; bottom: 30px;">
            <buttton class="ui blue button" onclick="displayaddmodal()">+　新增課程</button>
        </div>

        <div id="myModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">
            <div class="modal-header">
              <span class="close" onclick="clo()">&times;</span>
              <h3 id="lessonname"></h3>
            </div>
            <hr/>
            <div class="modal-body">
              <h4>課號</h4>
              <p id="lessoncode"></p>
              <h4>時間</h4>
              <p id="lessontime"></p>
              <h4>教室</h4>
              <p id="lessonplace"></p>
              <h4>老師</h4>
              <p id="lessonteacher"></p>
              <h4>ptt內容</h4>

            </div>
            <hr/>
            <div class="modal-footer">
              <button id="btnstyle" onclick="clo()">關閉</button>
            </div>
          </div>
        </div>


        <div id="addModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">
            <div class="modal-header">
              <span class="close" onclick="clo2()">&times;</span>
              <h3>新增課程</h3>
            </div>

            <div class="modal-body">

                類別:<SELECT id="category" class="form-control" onchange="df()" required>
		                    <OPTION value = "必修" selected>必修</OPTION>
            		        <OPTION value = "選修">選修</OPTION>
            		        <OPTION value = "通識">通識</OPTION>
            		        <OPTION value = "體育">體育</OPTION>
            	       </SELECT></br>
                科目名稱:<input type='text' class="form-control" id="lesson" required/></br>
                <div style="display:block" id="formgrade">
                  年級:<SELECT id="grade" class="form-control">
                          <OPTION value = "無">無</OPTION>
  		                    <OPTION value = "1" selected>1</OPTION>
              		        <OPTION value = "2">2</OPTION>
                          <OPTION value = "3">3</OPTION>
                          <OPTION value = "4">4</OPTION>
              	       </SELECT></br>
                </div>
                <div style="display:block" id="formdepartment">
                  系所:<SELECT id="department" class="form-control">
                          <OPTION value = "無">無</OPTION>
                          <OPTION value = "文學院" selected>文學院</OPTION>
  		                    <OPTION value = "資訊管理學系學士班" selected>資訊管理學系學士班</OPTION>
              		        <OPTION value = "機械工程學系學士班A">機械工程學系學士班A</OPTION>
              	       </SELECT></br>
                </div>
                <div style="display:none" id="formfield">
                  領域:<SELECT id="field" class="form-control">
                          <OPTION value = "無" selected>無</OPTION>
  		                    <OPTION value = "人文">人文</OPTION>
              		        <OPTION value = "社會">社會</OPTION>
              		        <OPTION value = "自然">自然</OPTION>
              	       </SELECT></br>
                </div>
                選課號碼:<input type='text' class="form-control" id="codenumber" required/></br>
                學分:<input type='text' class="form-control" id="points" required/></br>
                上課星期:<input type='text' class="form-control" id="lessonweek" required/></br>
                上課節次:<input type='text' class="form-control" id="lessonnode" required/></br>
                教室:<input type='text' class="form-control" id="classroom" required/></br>
                老師:<input type='text' class="form-control" id="teacher" required/></br>
                開課人數:<input type='text' class="form-control" id="people" required/></br>
                <input type="button" value="提交" id="btnstyle" onclick="hasnull()"/>

            </div>
            <div class="modal-footer">
              <button id="btnstyle" onclick="clo2()">關閉</button>
            </div>
          </div>
        </div>


        <div id="editModal" class="modal">
          <!-- Modal content -->
          <div class="modal-content">
            <div class="modal-header">
              <span class="close" onclick="clo3()">&times;</span>
              <h3>修改課程</h3>
            </div>

            <div class="modal-body">

                類別:<SELECT id="editcategory" class="form-control" disabled required>
		                    <OPTION value = "必修" selected>必修</OPTION>
            		        <OPTION value = "選修">選修</OPTION>
            		        <OPTION value = "通識">通識</OPTION>
            		        <OPTION value = "體育">體育</OPTION>
            	       </SELECT></br>
                科目名稱:<input type='text' class="form-control" id="editlesson" required/></br>
                <div style="display:block" id="editformgrade">
                  年級:<SELECT id="editgrade" class="form-control">
                          <OPTION value = "無">無</OPTION>
  		                    <OPTION value = "1" selected>1</OPTION>
              		        <OPTION value = "2">2</OPTION>
                          <OPTION value = "3">3</OPTION>
                          <OPTION value = "4">4</OPTION>
              	       </SELECT></br>
                </div>
                <div style="display:block" id="editformdepartment">
                  系所:<SELECT id="editdepartment" class="form-control" disabled>
                          <OPTION value = "無">無</OPTION>
  		                    <OPTION value = "資訊管理學系學士班" selected>資訊管理學系學士班</OPTION>
              		        <OPTION value = "機械工程學系學士班A">機械工程學系學士班A</OPTION>
              	       </SELECT></br>
                </div>
                <div style="display:none" id="editformfield">
                  領域:<SELECT id="editfield" class="form-control">
                          <OPTION value = "無" selected>無</OPTION>
  		                    <OPTION value = "人文">人文</OPTION>
              		        <OPTION value = "社會">社會</OPTION>
              		        <OPTION value = "自然">自然</OPTION>
              	       </SELECT></br>
                </div>
                選課號碼:<input type='text' class="form-control" id="editcodenumber" disabled/></br>
                學分:<input type='text' class="form-control" id="editpoints"/></br>
                上課星期:<input type='text' class="form-control" id="editlessonweek"/></br>
                上課節次:<input type='text' class="form-control" id="editlessonnode"/></br>
                教室:<input type='text' class="form-control" id="editclassroom"/></br>
                老師:<input type='text' class="form-control" id="editteacher"/></br>
                開課人數:<input type='text' class="form-control" id="editpeople"/></br>
                <input type="button" value="提交" id="btnstyle" onclick="edithasnull()"/>

            </div>
            <div class="modal-footer">
              <button id="btnstyle" onclick="clo3()">關閉</button>
            </div>
          </div>
        </div>

</body>

</html>
