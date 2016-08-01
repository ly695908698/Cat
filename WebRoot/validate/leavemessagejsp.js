// $方法
function $(id) {
	return document.getElementById(id);
}
function leaveMessageValidate() {
	var leaveMessageTextArea = $("leaveMessageTextArea").value;
	//alert("框框里面的只是："+leaveMessageTextArea);
	if (leaveMessageTextArea == null || leaveMessageTextArea == "") {
		pleaseInputLeaveMessage.style.display = "inline";
		return false;
	}
	return true;
}
