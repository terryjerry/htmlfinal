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

function show(){
      var week = $("#week").val();
      var classnode = $("#classnode").val();
      var txt1 = $("#option1").val();
      var txt2 = $("#option2").val();
      $.ajax({
        url: "jsp/show.jsp",                  //the script to call to get data
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
            content += "<div class='column'>" +
            "<div class='ui link card'>" +
            "<div class='content'>" +
            "<p class='header'>" + data2[i].科目名稱 +
            "<i class='ui right floated icon link black setting' onclick='displayedit(" + i + ")'></i></p><br/>" +
            "<p>" + data2[i].上課星期 + data2[i].上課節次 + "</p>" +
            "<p>" + data2[i].老師 + "</p>" +
            "</div>" +
            "<div class='content centered center aligned'>"+
            "<button class='ui blue button' onclick='detail(" + j + ")'>detail</button>" +
            "<button class='ui green button' onclick='remove(" + j + ")'>刪除</button></div>" +
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

function displayedit(index) {
  var c = lessonArray[index].類別;
  var txt2 = $("#option2").val();
  if(c == "必修" || c == "選修") {
    document.getElementById('editformgrade').style.display = "block";
    document.getElementById('editformdepartment').style.display = "block";
    document.getElementById('editformfield').style.display = "none";
    document.getElementById('editdepartment').value = txt2;
    document.getElementById('editfield').value = "無";
    document.getElementById('editgrade').value = lessonArray[index].年級;
  }else if(c == "通識") {
    document.getElementById('editformgrade').style.display = "none";
    document.getElementById('editformdepartment').style.display = "none";
    document.getElementById('editformfield').style.display = "block";
    document.getElementById('editdepartment').value = "無";
    document.getElementById('editgrade').value = "無";
    document.getElementById('editfield').value = lessonArray[index].領域;
  }else {
    document.getElementById('editformgrade').style.display = "none";
    document.getElementById('editformdepartment').style.display = "none";
    document.getElementById('editformfield').style.display = "none";
    document.getElementById('editdepartment').value = "無";
    document.getElementById('editgrade').value = "無";
    document.getElementById('editfield').value = "無";
  }
  document.getElementById('editcategory').value = c;
  document.getElementById('editlesson').value = lessonArray[index].科目名稱;
  document.getElementById('editcodenumber').value = lessonArray[index].選課號碼;
  document.getElementById('editpoints').value = lessonArray[index].學分;
  document.getElementById('editlessonweek').value = lessonArray[index].上課星期;
  document.getElementById('editlessonnode').value = lessonArray[index].上課節次;;
  document.getElementById('editclassroom').value = lessonArray[index].教室;
  document.getElementById('editteacher').value = lessonArray[index].老師;
  document.getElementById('editpeople').value = lessonArray[index].開課人數;
  document.getElementById('editModal').style.display = "block";
}

function edit(a,b,c,d,e,f,g,h,i,j,k) {
  $.ajax({
    url: 'jsp/edit.jsp',
    data: {a:a,b:b,c:c,d:d,e:e,f:f,g:g,h:h,i:i,j:j,k:k},
    dataType: "",
    success: function(data)
    {
      data = data.trim().toString();
      swal({
    		title: data,
    		text: "",
    		type: "success",
    		showCancelButton: false,
    		confirmButtonColor: '#5599FF',
    		confirmButtonText: 'OK',
    		closeOnConfirm: true
    	},
      	function(){
      		document.getElementById('editModal').style.display = "none";
          show();
      });
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

function remove(code) {
  code = detrans(code);
  var txt1 = $("#option1").val();
  var txt2 = $("#option2").val();
  var txt3 = "0";
  if(txt1 == "必修" || txt1 == "選修") {
    swal({
      title: "是否刪除所有系的此課程",
      text: "",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: '#5599FF',
      confirmButtonText: 'OK',
      closeOnConfirm: true
    },
    function(isConfirm){
      if (isConfirm){
        txt3 = "1";
      }
      $.ajax({
        url: 'jsp/remove.jsp',
        data: {a:txt1,b:txt2,c:txt3,d:code},
        dataType:"text",
        success: function(data)
        {
          data = data.trim().toString();
          swal({
        		title: data,
        		text: "",
        		type: "success",
        		showCancelButton: false,
        		confirmButtonColor: '#5599FF',
        		confirmButtonText: 'OK',
        		closeOnConfirm: true
        	},
        	function(){
        		show();
        	});
        },
        error: function(data){
          console.log(data.responseText);
        }
      });
    });
  }else {
    $.ajax({
      url: 'jsp/remove.jsp',
      data: {a:txt1,b:txt2,c:txt3,d:code},
      dataType:"text",
      success: function(data)
      {
        data = data.trim().toString();
        swal({
          title: data,
          text: "",
          type: "success",
          showCancelButton: false,
          confirmButtonColor: '#5599FF',
          confirmButtonText: 'OK',
          closeOnConfirm: true
        },
        function(){
          show();
        });
      },
      error: function(data){
        console.log(data.responseText);
      }
    });
  }

}


// When the user clicks on <span> (x), close the modal
function clo() {
  document.getElementById('myModal').style.display = "none";
}
function clo2() {
  document.getElementById('addModal').style.display = "none";
}
function clo3() {
  document.getElementById('editModal').style.display = "none";
}
function displayaddmodal() {
  document.getElementById('codenumber').value = "";
  document.getElementById('lesson').value = "";
  document.getElementById('points').value = "";
  document.getElementById('lessonweek').value = "";
  document.getElementById('lessonnode').value = "";;
  document.getElementById('classroom').value = "";
  document.getElementById('teacher').value = "";
  document.getElementById('people').value = "";
  document.getElementById('addModal').style.display = "block";
}

function df() {
  var c = document.getElementById('category').value
  if(c == "必修" || c == "選修") {
    document.getElementById('formgrade').style.display = "block";
    document.getElementById('formdepartment').style.display = "block";
    document.getElementById('formfield').style.display = "none";
    document.getElementById('department').value = "資訊管理學系學士班";
    document.getElementById('grade').value = "1";
    document.getElementById('field').value = "無";
  }else if(c == "通識") {
    document.getElementById('formgrade').style.display = "none";
    document.getElementById('formdepartment').style.display = "none";
    document.getElementById('formfield').style.display = "block";
    document.getElementById('department').value = "無";
    document.getElementById('grade').value = "無";
    document.getElementById('field').value = "人文";
  }else {
    document.getElementById('formgrade').style.display = "none";
    document.getElementById('formdepartment').style.display = "none";
    document.getElementById('formfield').style.display = "none";
    document.getElementById('department').value = "無";
    document.getElementById('grade').value = "無";
    document.getElementById('field').value = "無";
  }
}
function hasnull() {
  var a = document.getElementById('category').value;
  var b = document.getElementById('lesson').value;
  var c = document.getElementById('grade').value;
  var d = document.getElementById('department').value;
  var e = document.getElementById('field').value;
  var f = document.getElementById('codenumber').value;
  var g = document.getElementById('points').value;
  var h = document.getElementById('lessonweek').value;
  var i = document.getElementById('lessonnode').value;
  var j = document.getElementById('classroom').value;
  var k = document.getElementById('teacher').value;
  var l = document.getElementById('people').value;
  if(a == "" || b == "" || c == "" || d == "" || e == "" || f == "" || g == "" || h == "" || i == "" || j == "" || k == "" || l == "") {
    swal("","有欄位尚未填寫","error");
  }else{
    add();
  }
}

function edithasnull() {
  var a = document.getElementById('editgrade').value;
  var b = document.getElementById('editcategory').value;
  var c = document.getElementById('editfield').value;
  var d = document.getElementById('editcodenumber').value;
  var e = document.getElementById('editlesson').value;
  var f = document.getElementById('editpoints').value;
  var g = document.getElementById('editlessonweek').value;
  var h = document.getElementById('editlessonnode').value;
  var i = document.getElementById('editclassroom').value;
  var j = document.getElementById('editteacher').value;
  var k = document.getElementById('editpeople').value;
  if(a == "" || b == "" || c == "" || d == "" || e == "" || f == "" || g == "" || h == "" || i == "" || j == "" || k == "") {
    swal("","有欄位尚未填寫","error");
  }else{
    edit(a,b,c,d,e,f,g,h,i,j,k);
  }
}
function add() {
  var a = document.getElementById('category').value;
  var b = document.getElementById('lesson').value;
  var c = document.getElementById('grade').value;
  var d = document.getElementById('department').value;
  var e = document.getElementById('field').value;
  var f = document.getElementById('codenumber').value;
  var g = document.getElementById('points').value;
  var h = document.getElementById('lessonweek').value;
  var i = document.getElementById('lessonnode').value;
  var j = document.getElementById('classroom').value;
  var k = document.getElementById('teacher').value;
  var l = document.getElementById('people').value;
  $.ajax({
    url: 'jsp/add.jsp',
    data: {a:a,b:b,c:c,d:d,e:e,f:f,g:g,h:h,i:i,j:j,k:k,l:l},
    dataType:"text",
    success: function(data)
    {
      data = data.trim().toString();
      swal({
    		title: data,
    		text: "",
    		type: "success",
    		showCancelButton: false,
    		confirmButtonColor: '#5599FF',
    		confirmButtonText: 'OK',
    		closeOnConfirm: true
    	},
    	function(){
    		document.getElementById('addModal').style.display = "none";
    	});
    },
    error: function(data){
      console.log(data.responseText);
    }
  });
}
