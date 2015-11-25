jQuery(document).ready(function($) {
	var processed = {};
	$('img[data-autocrop=true]').each(function(){
		$(this).load(function(){
			window.setTimeout(function(){
				var img = this;
				if(processed[img.src]) return;
				processed[img.src] = true;
				var options = {
					width: $(img).data('cropx'),
					height: $(img).data('cropy')
				}
				SmartCrop.crop(img, options, function(result){
					var crop = result.topCrop,
						canvas = $('<canvas>')[0],
						ctx = canvas.getContext('2d');
					canvas.width = options.width;
					canvas.height = options.height;
					ctx.drawImage(img, crop.x, crop.y, crop.width, crop.height, 0, 0, canvas.width, canvas.height);
					$(img).replaceWith(canvas);
				});
			}.bind(this), 10);
		});
		if(this.complete)
			$(this).load();
	});
});