jQuery(document).ready(function($) {
	$('.slideshow').each(function() {
		var val = $(this),
			pswpElement = $('.pswp').get(0), // Global
			// cover = val.find('.cover'),
			items = JSON.parse(val.find('.slideshowData').text());
			options = {
				index: 0 // start at first slide
			};
			val.click(function(event) {
				gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
				gallery.init();
			});
	});
});