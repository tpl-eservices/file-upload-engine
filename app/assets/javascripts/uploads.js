$(function () {
	Dropzone.autoDiscover = false;

	$("#my-dropzone").dropzone({
		maxFileSize: 10,
		addRemoveLinks: true,
		paramName: "files"
	})
});