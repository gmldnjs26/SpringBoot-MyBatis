function go_save() {
	if (document.formm.u_id.value == "") {
		alert("IDをご入力してください。");
		document.formm.id.focus();
	}else if (document.formm.u_id.value != document.formm.reid.value) {
		alert("ID重複ご確認してください。");
		document.formm.id.focus();
	}
	else if (document.formm.u_pwd.value == "") {
		alert("パスワードをご入力ください。");
		document.formm.u_pwd.focus();
	} else if ((document.formm.u_pwd.value != document.formm.pwdCheck.value)) {
		alert("確認パスワードが異なります。");
		document.formm.pwd.focus();
	} else if (document.formm.u_name.value == "") {
		alert("名前を入力してください。");
		document.formm.name.focus();
	} else if (document.formm.email.value == "") {
		alert("Eメールを入力してください。");
		document.formm.email.focus();
	} else {
		document.formm.address.value = document.formm.addr1.value+" "+document.formm.addr2.value;
		alert(document.formm.address.value);
		document.formm.action = "join";
		document.formm.submit();
	}
}

function idcheck() {
	if (document.formm.u_id.value == "") {
		alert('IDをご入力してください。');
		document.formm.u_id.focus();
		return;
	}
	var url = "id_check_form?id="+ document.formm.u_id.value;
	window
			.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
}

function post_zip() {
    var zip = $('#zip_num').val();
    // ここでzipのバリデーションを行ってください

    $.ajax({
      type : 'get',
      url : 'https://zip-cloud.appspot.com/api/search',
      dataType : 'jsonp',
      data : {
        zipcode : zip
      },
      success : function(resp){
        if(resp.status == 200){
          // APIのレスポンスから住所情報を取得
          var obj = resp.results[0];
          if (obj.length < 5) {
            alert('正しい郵便番号を入力してください');
            return false;
          }
          //$('#country').val(obj[4]['long_name']); // 国
          $('#addr1').val(obj.address1 +' ' + obj.address2+ ' ' + obj.address3) // 都道府県
           // 市区町村
        } else{
          alert('住所情報が取得できませんでした');
          return false;
        }
      }
    });
  }


function go_next() {
	if (document.formm.okon1[0].checked == true) {
		document.formm.action = "join_form";
		document.formm.submit();
	} else if (document.formm.okon1[1].checked == true) {
		alert('約款に同意しない場合,会員加入は不可能です。');
	}
}