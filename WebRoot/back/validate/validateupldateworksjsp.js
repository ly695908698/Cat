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

function validateWorkSrc() {
	var workSrc = $("workSrc").value;
	if (workSrc == null || workSrc == "") {
		pleaseInputWorkSrc.style.display = "inline";
		$("workSrc"),focus();
		return false;
	}
	return true;
}
// 全部验证
function validateAll() {
	if (validateWorkName()&&validateWorkSrc()) {
		return true;
	}
	return false;
}

// 清空信息
function clearWorkSrcMsg() {
	var workSrc = $("workSrc").value;
	if (workSrc != null || workSrc != "") {
		pleaseInputWorkSrc.style.display = "none";
	}
}
function clearAlbumCoverMsg() {
	var albumCover = $("albumCover").value;
	if (albumCover != null || albumCover != "") {
		pleaseInputAlbumCover.style.display = "none";
	}
}
