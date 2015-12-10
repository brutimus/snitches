# The DocPad Configuration File

String::startsWith ?= (s) -> @slice(0, s.length) == s

# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://brutimus.github.io/snitches"
			# url: "http://projects.ocregister.com/snitches"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.website.com',
				'website.herokuapp.com'
			]

			# The default title of our website
			title: "Jailhouse Snitches | The Orange County Register"

			# The website description (for SEO)
			description: """
				Jailhouse snitches are rarely prisoners who happen to overhear confessions. Inmates apply for the job and they become part of a roster of covert operatives whose surveillance on behalf of law enforcement has put the Orange County justice system at the center of a national debate.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				orange, county, california, jail, jailhouse, snitch, informant
				"""

			# The website author's name
			author: "Sean Stoops"

			# The website author's email
			email: "sstoops@freedom.com"

			# Styles
			styles: [
				"/styles/style.css"
				"/vendor/photoswipe/photoswipe.css"
				"/vendor/photoswipe/default-skin/default-skin.css"
				"//cdn.knightlab.com/libs/soundcite/latest/css/player.css"
			]

			# Scripts
			scripts: [
				"/scripts/built.min.js"
				"//cdn.knightlab.com/libs/soundcite/latest/js/soundcite.min.js"
			]

			nav: [
				["/", "Home"]
				["/pages/archive", "Archive"]
				["/pages/documents", "Documents"]
				["/pages/glossary", "Glossary"]
			]


		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		# Get the Absolute URL of a document
		getUrl: (_, site) ->
			site = site || @site.url

			if (typeof _ == "string")
				if _.startsWith('http')
					return _
				else if (_[0] == "/" && _[1] != "/")
					return site+_
				return _

			if (typeof _ == "object")
				if (_.url)
					return @getUrl(_.url,site)
				if (_.map)
					_getUrl = arguments.callee
					return _.map((d) ->
						return _getUrl(d,site)
					)

			return _

		getImageSize: (img) ->
			if (img.startsWith('http'))
				return {'width': 1200, 'height': 800}
			else
				sizeOf = require('image-size')
				dimensions = sizeOf(img)
				return dimensions

		displayGallery: (name) ->
			gallery = @getFileAtPath('galleries/' + name).toJSON()
			jsonData = []
			for img in gallery.images
				if img.src.startsWith('http')
					imgUrl = img.src
				else
					imgUrl = 'src/static' + img.src
				if img.width && img.height
					imgDims = {'width': img.width, 'height': img.height}
				else
					imgDims = @getImageSize(imgUrl)
				
				jsonData.push({
					src: img.src,
					title: img.caption,
					byline: img.byline,
					w: imgDims.width,
					h: imgDims.height
				})
			jsonData = JSON.stringify(jsonData)

			return """
				<div class="slideshow">
					<div class="overlay view-label">
						<i class="glyphicon glyphicon-picture"></i> <span>View slideshow</span>
					</div>
					<img class="cover" src="#{gallery.images[0].src}" style="width:100%;" />
					<div class="slideshowData" style="display:none;">
						#{jsonData}
					</div>
				</div>
			"""


	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		articles: (database) ->
			database.findAllLive({tags:$has:'article'}, [date:-1])

		links: (database) ->
			database.findAllLive({tags:$has:'link'}, [date:-1])

		archive: (database) ->
			database.findAllLive({$or: [{tags: $has:'article'}, {tags: $hasAll: ['link', 'archive']}]}, [date:-1])

		galleries: (database) ->
			database.findAllLive({tags:$has:'gallery'}, [date:-1])


	# =================================
	# Plugins

	plugins:
		downloader:
			downloads: [
				{
					name: 'Bootstrap'
					path: 'src/static/vendor/twitter-bootstrap'
					url: 'https://codeload.github.com/twbs/bootstrap/tar.gz/v3.3.6'
					tarExtractClean: true
				}
			]

	# =================================
	# Environments

	environments:
		development:
			templateData:
				site:
					url: 'http://localhost:9778'


	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

		# Write After
		# Used to minify our assets with grunt
		writeAfter: (opts,next) ->
			# Prepare
			safeps = require('safeps')
			pathUtil = require('path')
			docpad = @docpad
			rootPath = docpad.getConfig().rootPath

			 # Perform the grunt `min` task
			# https://github.com/gruntjs/grunt/blob/0.3-stable/docs/task_min.md
			command = ['grunt', 'uglify']

			# Execute
			safeps.spawn(command, {save:false,output:true}, next)

			# Chain
			@
}


# Export our DocPad Configuration
module.exports = docpadConfig
