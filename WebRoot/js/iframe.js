function SetCwinHeight(iframeObj) {
	if (document.getElementById) {
		if (iframeObj) {
			this.height = iframepage.document.body.scrollHeight;
			if (iframeObj.contentDocument
					&& iframeObj.contentDocument.body.offsetHeight) {
				iframeObj.height = iframeObj.contentDocument.body.offsetHeight + 40;
			} else if (document.frames[iframeObj.name].document
					&& document.frames[iframeObj.name].document.body.scrollHeight) {
				iframeObj.height = document.frames[iframeObj.name].document.body.scrollHeight + 40;
			}
		}
	}
}