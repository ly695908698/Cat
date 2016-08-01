//获取对象的方法
function $(id) {
	return document.getElementById(id);
}
// 判断网站名称是否输入
function validateWorkName() {
	var workName = $("workName").value;
	if (workName == null || workName == "") {
		pleaseInputWorkName.style.display = "inline";
		$("workName").focus();
		return false;
	}
	return true;
}

function validateAlbumCover() {
	var albumCover = $("albumCover").value;
	if (albumCover == null || albumCover == "") {
		pleaseInputAlbumCover.style.display = "inline";
		$("albumCover"),focus();
		return false;
	}
	return true;
}
// 全部验证
function validateAll() {
	if (validateWorkName() && validateAlbumCover()) {
		return true;
	}
	return false;
}

// 清空信息
function clearWorkNameMsg() {
	var workName = $("workName").value;
	if (workName != null || workName != "") {
		pleaseInputWorkName.style.display = "none";
	}
}
function clearAlbumCoverMsg() {
	var albumCover = $("albumCover").value;
	if (albumCover != null || albumCover != "") {
		pleaseInputAlbumCover.style.display = "none";
	}
}
