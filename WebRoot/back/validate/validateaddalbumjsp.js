//获取对象的方法
function $(id) {
	return document.getElementById(id);
}

function validateAlbumCover() {
	var albumCover = $("albumCover").value;
	if (albumCover == null || albumCover == "") {
		pleaseInputAlbumCover.style.display = "inline";
		return false;
	}
	return true;
}
function validateAlbumName() {
	var albumName = $("albumName").value;
	if (albumName == null || albumName == "") {
		pleaseInputAlbumName.style.display = "inline";
		$("albumName").focus();
		return false;
	}
	return true;
}
// 全部验证
function validateAll() {
	if (validateAlbumName()&&validateAlbumCover()) {
		return true;
	}
	return false;
}

// 清空信息
function clearAlbumCoverMsg() {
	var albumCover = $("albumCover").value;
	if (albumCover != null || albumCover != "") {
		pleaseInputAlbumCover.style.display = "none";
	}
}
function clearAlbumNameMsg() {
	var albumName = $("albumName").value;
	if (albumName != null || albumName != "") {
		pleaseInputAlbumName.style.display = "none";
	}
}
