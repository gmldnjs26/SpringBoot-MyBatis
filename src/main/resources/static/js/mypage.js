function go_cart() {
	if(document.formm.loginUser.value == ""){
		alert("ログインしてください。");
		document.formm.action = "login_form";
		document.formm.submit();
	}
	else if (document.formm.quantity.value == "") {
		alert("数量を入力してください。");
		document.formm.quantity.focus();
	} else {
		document.formm.action = "cart_insert";
		document.formm.submit();
	}
}

function go_cart_delete() {
	var count = 0;
	for (var i=0; i < document.formm.cseq.length; i++){
		if(document.formm.cseq[i].checked == true){
			count++;
		}
	}
	// 一つしか選択されてなかったら配列を戻さないので
	if (count !== 0 || document.formm.cseq.checked) {
		document.formm.action = "cart_delete";
		document.formm.submit();
		// return 0 ここで提出すると終了になると思いましたがそれじゃなかった.
	} else{
		alert("削除する項目を選んでください");
	}

}
function go_order_insert() {
	var count = 0;
	for(var i=0; i < document.formm.cseq.length; i++){
		if(document.formm.cseq[i].checked == true){
			count++;
		}
	}
	if(count !== 0 || document.formm.cseq.checked) {
		document.formm.action = "order_insert";
		document.formm.submit();
	}else{
		alert("注文する項目を選んでください");
	}
}

function go_order_delete() {
	var count = 0;
	for (var i = 0; i < document.formm.oseq.length; i++) {
		if (document.formm.oseq[i].checked == true) {
			count++;
		}
	}
	if (count == 0) {
		alert("削除する項目を選択してください。");

	} else {
		document.formm.action = "order_delete";
		document.formm.submit();
	}
}

function go_order() {
	document.formm.action = "mypage";
	document.formm.submit();
}