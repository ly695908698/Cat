//获取对象的方法
function $(id) {
	return document.getElementById(id);
}
// 判断网站名称是否输入
function validateAlbumName() {
	var albumName = $("albumName").value;
	if (albumName == null || albumName == "") {
		pleaseInputAlbumName.style.display = "inline";
		$("albumName").focus();
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
	if (validateAlbumName() && validateAlbumCover()) {
		return true;
	}
	return false;
}

// 清空信息
function clearAlbumNameMsg() {
	var albumName = $("albumName").value;
	if (albumName != null || albumName != "") {
		pleaseInputAlbumName.style.display = "none";
	}
}
function clearAlbumCoverMsg() {
	var albumName = $("albumName").value;
	if (albumName != null || albumName != "") {
		pleaseInputAlbumCover.style.display = "none";
	}
}
