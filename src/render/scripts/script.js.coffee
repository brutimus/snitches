SocialShareKit.init()

(($) ->
	$(window).scroll (e) ->
		$(window).off 'scroll'
		i = $('.lead-container img')
		i.attr 'src', i.data('gifsrc')

	monthMap = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

	latestNewsBlock = $('#latestNewsBlock')
	if latestNewsBlock
		$.getJSON "http://crossorigin.me/http://www.ocregister.com/common/templates/json_geo.php?cat=25474&category_children=1&start=0&max=5"
		.then (result) ->
			for story in result
				headline = story.headline
				url = story.link
				date = new Date(story.pub_date)
				month = monthMap[date.getMonth()]
				day = date.getDate()
				year = date.getFullYear()
				latestNewsBlock.append """
					<div class="media">
						<a href="#{url}">
							<div class="media-left">
								<div class="date">
									<div class="month">#{month}.</div>
									<div class="day">#{day}</div>
									<div class="year">#{year}</div>
								</div>
							</div>
							<div class="media-body">
							    #{headline}
							</div>
						</a>
					</div>"""

) jQuery