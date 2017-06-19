<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*,org.json.*" %>
<%
  if(session.getAttribute("user") == null) {
    response.sendRedirect("/htmlfinal/login/login.jsp");
  }
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' integrity='sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1' crossorigin='anonymous'/>
    <link rel='stylesheet' href='/htmlfinal/user/stufinite/css/stufinite.css'/>
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' integrity='sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1' crossorigin='anonymous'/>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css' rel='stylesheet'/>
    <link rel='stylesheet' href='/htmlfinal/user/timetable/css/timetable.css'/>
    <link rel='stylesheet' href='/htmlfinal/user/timetable/css/searchbar.css'/>

    <script src="/htmlfinal/user/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="/htmlfinal/user/css/sweetalert.css">

    <script src='/htmlfinal/user/js/execute.js'></script>
    <link rel="stylesheet" href="/htmlfinal/user/css/execute.css">
  </head>

  <body onload="re()" style='background-color: #E4A578;'>

    <header class='stufinite-header' style='background-color:#D2691E;'>
      <div class='stufinite-header-title'>
        <i class="fa fa-cog fa-spin  fa-fw" aria-hidden="true"></i>
        <span>選課小幫手</span>
      </div>
      <div class='stufinite-header-item'>
        <a href="/htmlfinal/login/logout.jsp" style="position:absolute;right:50px">Logout</a>
        <a href="/htmlfinal/user/jsp/manage.jsp" style="position:absolute;right:150px">管理員</a>
        <a href="#" style="position:absolute;right:250px" onclick="printScreen(ble)" >Printing</a>
      </div>
    </header>

    <div class='stufinite-app-container' >
      <div class='stufinite-app-content'>
        <section class="stufinite-app-searchbar-container" style='background-color:#F6E1D2'>
          <div class='stufinite-searchbar-title'>
            <i class="fa fa-search" aria-hidden="true"></i>
            <span>搜尋</span>
          </div>
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
          <br/>
          <SELECT name="option1" id="option1" size=1>
		        <OPTION value = "必修" selected>必修</OPTION>
		        <OPTION value = "選修">選修</OPTION>
		        <OPTION value = "通識">通識</OPTION>
		        <OPTION value = "體育">體育</OPTION>
	        </SELECT>
          <SELECT name="option2" id="option2" size=1>
            <OPTION value = "文學院" selected>文學院</OPTION>
		        <OPTION value = "資訊管理學系學士班" selected>資訊管理學系學士班</OPTION>
		        <OPTION value = "機械工程學系學士班A">機械工程學系學士班A</OPTION>
	        </SELECT>
          <input type="button" value="送出" id="btnstyle" onclick="show()"/>
          <div id="thing">
          </div>
        </section>

        <section class='timetable' id='ble' style="background-color:#DEB887;">
          <table class='table'>
              <thead>
                  <tr>
                      <th style='width: 4%;'></th>
                      <th style='width: 19%;'>一</th>
                      <th style='width: 19%;'>二</th>
                      <th style='width: 19%;'>三</th>
                      <th style='width: 19%;'>四</th>
                      <th style='width: 19%;'>五</th>
                  </tr>
              </thead>
              <tbody>
                  <tr data-hour='1'>
                      <th>
                          <h5 class='time'>08:10</h5>
                      </th>
                      <td data-day='1' id="11"></td>
                      <td data-day='2' id="21"></td>
                      <td data-day='3' id="31"></td>
                      <td data-day='4' id="41"></td>
                      <td data-day='5' id="51"></td>
                  </tr>
                  <tr data-hour='2'>
                      <th>
                          <h5 class='time'>09:10</h5>
                      </th>
                      <td data-day='1' id="12"></td>
                      <td data-day='2' id="22"></td>
                      <td data-day='3' id="32"></td>
                      <td data-day='4' id="42"></td>
                      <td data-day='5' id="52"></td>
                  </tr>
                  <tr data-hour='3'>
                      <th>
                          <h5 class='time'>10:10</h5>
                      </th>
                      <td data-day='1' id="13"></td>
                      <td data-day='2' id="23"></td>
                      <td data-day='3' id="33"></td>
                      <td data-day='4' id="43"></td>
                      <td data-day='5' id="53"></td>
                  </tr>
                  <tr data-hour='4'>
                      <th>
                          <h5 class='time'>11:10</h5>
                      </th>
                      <td data-day='1' id="14"></td>
                      <td data-day='2' id="24"></td>
                      <td data-day='3' id="34"></td>
                      <td data-day='4' id="44"></td>
                      <td data-day='5' id="54"></td>
                  </tr>
                  <tr data-hour='5'>
                      <th>
                          <h5 class='time'>13:10</h5>
                      </th>
                      <td data-day='1' id="15"></td>
                      <td data-day='2' id="25"></td>
                      <td data-day='3' id="35"></td>
                      <td data-day='4' id="45"></td>
                      <td data-day='5' id="55"></td>
                  </tr>
                  <tr data-hour='6'>
                      <th>
                          <h5 class='time'>14:10</h5>
                      </th>
                      <td data-day='1' id="16"></td>
                      <td data-day='2' id="26"></td>
                      <td data-day='3' id="36"></td>
                      <td data-day='4' id="46"></td>
                      <td data-day='5' id="56"></td>
                  </tr>
                  <tr data-hour='7'>
                      <th>
                          <h5 class='time'>15:10</h5>
                      </th>
                      <td data-day='1' id="17"></td>
                      <td data-day='2' id="27"></td>
                      <td data-day='3' id="37"></td>
                      <td data-day='4' id="47"></td>
                      <td data-day='5' id="57"></td>
                  </tr>
                  <tr data-hour='8'>
                      <th>
                          <h5 class='time'>16:10</h5>
                      </th>
                      <td data-day='1' id="18"></td>
                      <td data-day='2' id="28"></td>
                      <td data-day='3' id="38"></td>
                      <td data-day='4' id="48"></td>
                      <td data-day='5' id="58"></td>
                  </tr>
                  <tr data-hour='9'>
                      <th>
                          <h5 class='time'>17:10</h5>
                      </th>
                      <td data-day='1' id="19"></td>
                      <td data-day='2' id="29"></td>
                      <td data-day='3' id="39"></td>
                      <td data-day='4' id="49"></td>
                      <td data-day='5' id="59"></td>
                  </tr>
                  <%-- <tr data-hour='10'>
                      <th>
                          <h5 class='time'>18:20</h5>
                      </th>
                      <td data-day='1' id="1A"></td>
                      <td data-day='2' id="2A"></td>
                      <td data-day='3' id="3A"></td>
                      <td data-day='4' id="4A"></td>
                      <td data-day='5' id="5A"></td>
                  </tr>
                  <tr data-hour='11'>
                      <th>
                          <h5 class='time'>19:15</h5>
                      </th>
                      <td data-day='1' id="1B"></td>
                      <td data-day='2' id="2B"></td>
                      <td data-day='3' id="3B"></td>
                      <td data-day='4' id="4B"></td>
                      <td data-day='5' id="5B"></td>
                  </tr>
                  <tr data-hour='12'>
                      <th>
                          <h5 class='time'>20:10</h5>
                      </th>
                      <td data-day='1' id="1C"></td>
                      <td data-day='2' id="2C"></td>
                      <td data-day='3' id="3C"></td>
                      <td data-day='4' id="4C"></td>
                      <td data-day='5' id="5C"></td>
                  </tr>
                  <tr data-hour='13'>
                      <th>
                          <h5 class='time'>21:05</h5>
                      </th>
                      <td data-day='1' id="1D"></td>
                      <td data-day='2' id="2D"></td>
                      <td data-day='3' id="3D"></td>
                      <td data-day='4' id="4D"></td>
                      <td data-day='5' id="5D"></td>
                  </tr> --%>
              </tbody>
          </table>
        </section>
      </div>
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







    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src='/copy/static/stufinite/js/stufinite.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="/htmlfinal/user/timetable/js/StufiniteSearchbar.js"></script>
    <script src="/htmlfinal/user/timetable/js/StufiniteTimetable.js"></script>
  </body>

</html>
