$(document).on('turbolinks:load', function() {
	$('#upload_tag_list').tagsInput({
		'height': 'auto',
		'width': 'auto'
	});

	$(".copyEventUrl").click(function() {
		let largeUrl = $(this).closest(".urlContainer").next().find(".imageContainer.large").attr("url"),
			mediumUrl = $(this).closest(".urlContainer").next().find(".imageContainer.medium").attr("url"),
			smallUrl = $(this).closest(".urlContainer").next().find(".imageContainer.small").attr("url"),
			eventUrl = {
				smallUrl: smallUrl,
				mediumUrl: mediumUrl,
				largeUrl: largeUrl
			}
		eventUrl = JSON.stringify(eventUrl);
		copyToClipboard(eventUrl);
		$(this).next().addClass("active");
		$(this).next().html("Copied event url to clipboard.");
	});

	$(".toggleTagEdit").click(function() {
		$(".edit_upload").toggleClass("active");
	});

	$(".multiContainer").hover(function() {
		let uploadId = $(this).attr("upload_id");
		$(`.multiContainer[upload_id=${uploadId}]`).closest(".fileContainer").toggleClass("active");
	});

	$(document).keydown(function() {
		let keyCode = event.keyCode;
		if (keyCode === 192) {
			$(".sidebar").toggleClass("inactive");
		}
	});

	$(".sidebarToggle").click(function() {
		$(".sidebar").toggleClass("inactive");
	});

	$(".hamburger").click(function() {
		$(this).toggleClass("is-active");
		$(".navbarMobileLinks").slideToggle("fast");
	});
});

function copyToClipboard(text){
    var dummy = document.createElement("input");
    document.body.appendChild(dummy);
    dummy.setAttribute('value', text);
    dummy.select();
    document.execCommand("copy");
    document.body.removeChild(dummy);
}