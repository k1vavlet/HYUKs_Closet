var arr_img = ["img/Shopping_mall_silde001.PNG", "img/Shopping_mall_silde002.PNG", "img/Shopping_mall_silde003.PNG", "img/Shopping_mall_silde004.PNG", "img/Shopping_mall_silde005.PNG"];
var i = 0;
let myVar;

function pwd_Chk() {
	if (document.getElementById('pw').value != '' && document.getElementById('pwchk').value != '') {
		if (document.getElementById('pw').value != document.getElementById('pwchk').value) {

			document.getElementById('pw_chk_alert').innerHTML = "비밀번호 불일치";
			document.getElementById('pw_chk_alert').style.color = 'red';
			return true;
		}
		else {
			document.getElementById('pw_chk_alert').innerHTML = "비밀번호 일치";
			document.getElementById('pw_chk_alert').style.color = 'blue';
			return false;
		}
	}
}

function mImg_move() {
	if (i != arr_img.length) {
		document.getElementsByTagName("img")[1].src = arr_img[i];

		myVar = setTimeout(mImg_move, 1500);
		i++;

		if (i == arr_img.length) {
			i = 0;
		}
	}
}

function mStart() {
	myVar = setTimeout(mImg_move, 1500);
}

function mStop() {
	clearTimeout(myVar);
}

var cnt = 0;

function mBack() {
	if (i == 0) {
	}
	else {
		mStop();

		i--;
		document.getElementsByTagName("img")[1].src = arr_img[i];

		mStart();

		if (i == 0) {
			i = arr_img.length;
		}
	}
}

function mNext() {
	if (i != arr_img.length && i < arr_img.length) {
		mStop();

		document.getElementsByTagName("img")[1].src = arr_img[i];
		i++;

		mStart();

		if (i == arr_img.length) {
			i = 0;
		}
	}
	else { }
}