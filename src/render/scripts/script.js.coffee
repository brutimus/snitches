
(($) ->
	$(window).scroll (e) ->
		$(window).off 'scroll'
		i = $('.lead-container img')
		i.attr 'src', i.data('gifsrc')
) jQuery