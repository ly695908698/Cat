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

// 全部验证
function validateAll() {
	if (validateAlbumCover()) {
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

