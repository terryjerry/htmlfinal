var lessonArray = "";
function trans(data) {
  data = data.toString();
  var n = "";
  for(var i = 0; i < data.length; i++) {
    n += data.charCodeAt(i).toString();
  }
  return n;
}

function detrans(data) {
  data = data.toString();
  var n = "";
  var c = "";
  for(var i = 0; i < data.length; i+=2) {
    c = data.substr(i,2);
    n += String.fromCharCode(c);
  }
  return n;
}


function re() {
  $.ajax({
    url: 'jsp/refresh.jsp',
    success: function(data) {
      var data2 = JSON.parse(data);
      lessonArray = data2;
      for(var i = 0; i < data2.length; i++) {
        firstadd(i);
      }
    },
    error: function(data){
      console.log(data.responseText);
    }
  });
}

function firstadd(data) {
  var j = lessonArray[data].選課號碼;
  var id2 = lessonArray[data].上課星期 + lessonArray[data].上課節次;
  j = trans(j);
  id2 = trans(id2);
  for(var i = 0; i < lessonArray[data].上課節次.length; i++) {
    var id = lessonArray[data].上課星期 + lessonArray[data].上課節次.charAt(i);
    var content = "<div class='course' id=" + lessonArray[data].選課號碼 + ">" +
              "<i class='detail fa fa-book' aria-hidden='true' onclick='detail(" + j + ")'>" + "</i>" +
              "<i class='remove fa fa-trash' aria-hidden='true' onclick='remove(" + j + "," + id2 + ")'>" + "</i>" +
              "<span class='title'>" + lessonArray[data].科目名稱 + "</span>" +
              "<span class='professor'>" + lessonArray[data].老師 + "</span>" +
              "<div>";
    document.getElementById(id).innerHTML = content;
  }
}

function show(){
      var week = $("#week").val();
      var classnode = $("#classnode").val();
      var txt1 = $("#option1").val();
      var txt2 = $("#option2").val();
      $.ajax({
        url: 'jsp/show.jsp',                  //the script to call to get data
        data: {option1:txt1,option2:txt2,week:week,classnode:classnode},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
        //dataType: "json",    //data format
        success: function(data)          //on recieve of reply
        {
          var data2 = JSON.parse(data);
          lessonArray = data2;
          var content = "";
          for(var i = 0; i < data2.length; i++) {
            var j = data2[i].選課號碼;
            j = trans(j);
            content += "<div class='stufinite-searchbar-result-item'>" +
            "<h4 class='title'>" + data2[i].科目名稱 + "</h4>" +
            "<span>" + data2[i].上課星期 + data2[i].上課節次 + "</span>" +
            "<span>" + data2[i].老師 + "</span>" +
            "<div class='action-btn'>" +
            "<button onclick='add(" + i + ")'>" + "加入" + "</button>" +
            "<button onclick='detail(" + j + ")'>" + "detail" +
            "</button>" +
            "</div>" +
            "</div>";

          }
          document.getElementById("thing").innerHTML = content;

        },
        error: function(data){
          console.log(data.responseText);
        }
      });
}


function detail(code) {
  code = detrans(code);
  $.ajax({
    url: 'jsp/detail.jsp',                  //the script to call to get data
    data: {code:code},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
    dataType: "",    //data format
    success: function(data)          //on recieve of reply
    {
      var data2 = JSON.parse(data);
      document.getElementById("lessonname").innerHTML = data2.科目名稱;
      document.getElementById("lessoncode").innerHTML = data2.選課號碼;
      document.getElementById("lessontime").innerHTML = data2.上課星期 + data2.上課節次;
      document.getElementById("lessonplace").innerHTML = data2.教室;
      document.getElementById("lessonteacher").innerHTML = data2.老師;
      document.getElementById('myModal').style.display = "block";
    },
    error: function(data){
      console.log(data.responseText);
    }
  });
}
// When the user clicks on <span> (x), close the modal
function clo() {
  document.getElementById('myModal').style.display = "none";
}


function add(data) {
  var j = lessonArray[data].選課號碼;
  var id2 = lessonArray[data].上課星期 + lessonArray[data].上課節次;
  j = trans(j);
  id2 = trans(id2);
  var full = 0;
  for(var i = 0; i < lessonArray[data].上課節次.length; i++) {
    var id = lessonArray[data].上課星期 + lessonArray[data].上課節次.charAt(i);
    if($("#" + id).text() != "") {
      full = 1;
    }
  }
  if(full == 0) {
    for(var i = 0; i < lessonArray[data].上課節次.length; i++) {
      var id = lessonArray[data].上課星期 + lessonArray[data].上課節次.charAt(i);
      var content = "<div class='course' id=" + lessonArray[data].選課號碼 + ">" +
                "<i class='detail fa fa-book' aria-hidden='true' onclick='detail(" + j + ")'>" + "</i>" +
                "<i class='remove fa fa-trash' aria-hidden='true' onclick='remove(" + j + "," + id2 + ")'>" + "</i>" +
                "<span class='title'>" + lessonArray[data].科目名稱 + "</span>" +
                "<span class='professor'>" + lessonArray[data].老師 + "</span>" +
                "<div>";
      document.getElementById(id).innerHTML = content;
    }
    j = detrans(j);
    $.ajax({
      url: 'jsp/add.jsp',                  //the script to call to get data
      data: {code:j},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
      dataType: "",    //data format
      success: function(data)          //on recieve of reply
      {
      },
      error: function(data){
        console.log(data.responseText);
      }
    });
  }else {
    sweetAlert("此時段已選課");
  }
}

function remove(code,data) {
  code = detrans(code);
  var time = detrans(data);
  var content = "";
  for(var i = 1; i < time.length; i++) {
    var id = time.charAt(0) + time.charAt(i);
    document.getElementById(id).innerHTML = content;
  }
  $.ajax({
    url: 'jsp/remove.jsp',                  //the script to call to get data
    data: {code:code},                     //you can insert url argumnets here to pass to api.php for example "id=5&parent=6"
    dataType: "",    //data format
    success: function(data)          //on recieve of reply
    {
    },
    error: function(data){
      console.log(data.responseText);
    }
  });
}

function printScreen(printlist) {
     var value = printlist.innerHTML;
     var printPage = window.open("", "Printing...", "");
     printPage.document.open();
     printPage.document.write("<HTML><head></head><BODY onload='window.print();window.close()'>");
     printPage.document.write("<PRE>");
     printPage.document.write(value);
     printPage.document.write("</PRE>");
     printPage.document.close("</BODY></HTML>");
}
