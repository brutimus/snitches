# The DocPad Configuration File
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
			url: "http://brutimus.github.io/snitches/"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.website.com',
				'website.herokuapp.com'
			]

			# The default title of our website
			title: "Jailhouse Snitches | The Orange County Register"

			# The website description (for SEO)
			description: """
				When your website appears in search results in say Google, the text here will be shown underneath your website's title.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
				"""

			# The website author's name
			author: "Sean Stoops"

			# The website author's email
			email: "sstoops@freedom.com"

			# Styles
			styles: [
				"/styles/style.css"
			]

			# Scripts
			scripts: [
				"/vendor/twitter-bootstrap/dist/js/bootstrap.min.js"
				"/scripts/script.js"
			]

			archive_stories: [
				{
					headline: "DA pushes back at call for DOJ probe"
					url: "http://www.ocregister.com/articles/attorney-693017-office-district.html"
					date: "2015/11/19"
				}
				{
					headline: "Judge orders new trial for convicted killer after deputies won’t testify"
					url: "http://www.ocregister.com/articles/ortiz-692758-deputies-case.html"
					date: "2015/11/19"
				}
				{
					headline: "Former prosecutors seek federal probe"
					url: "http://www.ocregister.com/articles/orange-692665-attorney-county.html"
					date: "2015/11/18"
				}
				{
					headline: "Amid jailhouse informant scandal, county will oversee DA’s office"
					url: "http://www.ocregister.com/articles/office-691553-county-attorney.html"
					date: "2015/11/10"
				}
				{
					headline: "DA told in 1999 that it might have informant problems"
					url: "http://www.ocregister.com/articles/rackauckas-689306-jacobs-letter.html"
					date: "2015/10/26"
				}
				{
					headline: "Feds push county into action"
					url: "http://www.ocregister.com/articles/office-688290-county-spitzer.html"
					date: "2015/10/19"
				}
				{
					headline: "Deputies take the Fifth"
					url: "http://www.ocregister.com/articles/attorney-688078-case-deputies.html"
					date: "2015/10/18"
				}
				{
					headline: "County ponders jailhouse snitch scandal"
					url: "http://www.ocregister.com/articles/county-687985-office-attorney.html"
					date: "2015/10/16"
				}
				{
					headline: "Families of those killed struggle"
					url: "http://www.ocregister.com/articles/says-687026-webb-dekraai.html"
					date: "2015/10/11"
				}
				{
					headline: "Prosecutors face stricter standards"
					url: "http://www.ocregister.com/articles/prosecutors-686481-law-evidence.html"
					date: "2015/10/7"
				}
				{
					headline: "District Attorney calls snitch problem: baloney"
					url: "http://www.ocregister.com/articles/attorney-685527-office-district.html"
					date: "2015/9/30"
				}
				{
					headline: "Is Scott Sanders the most polarizing man in OC?"
					url: "http://www.ocregister.com/articles/sanders-684780-attorney-case.html"
					date: "2015/9/26"
				}
				{
					headline: "Judge won’t have to testify"
					url: "http://www.ocregister.com/articles/prickett-686404-judge-court.html"
					date: "2015/9/7"
				}
				{
					headline: "Suspected Mexican Mafia leader backs out of plea deal"
					url: "http://www.ocregister.com/articles/ojeda-686395-mexican-mafia.html"
					date: "2015/9/6"
				}
				{
					headline: "Department of Justice keeping an eye on allegations that Orange County prosecutors are illegally using informants"
					url: "http://www.ocregister.com/articles/county-673365-department-office.html"
					date: "2015/7/22"
				}
				{
					headline: "Watchdog: Is panel reviewing snitch scandal really independent?"
					url: "http://www.ocregister.com/articles/office-671724-county-attorney.html"
					date: "2015/7/14"
				}
				{
					headline: "State says judge wrong in recusing DA"
					url: "http://www.ocregister.com/articles/court-671738-case-state.html"
					date: "2015/7/14"
				}
				{
					headline: "Evidence withheld in murder case"
					url: "http://www.ocregister.com/articles/navarro-670506-list-attorney.html"
					date: "2015/7/6"
				}
				{
					headline: "Rauckackas recruits legal experts to review use of informants"
					url: "http://www.ocregister.com/articles/use-670384-informants-attorney.html"
					date: "2015/7/6"
				}
				{
					headline: "Judge in a storm: Thomas Goethals surprised many"
					url: "http://www.ocregister.com/articles/goethals-669116-judge-case.html"
					date: "2015/6/29"
				}
				{
					headline: "Jailhouse snitch threatens another conviction"
					url: "http://www.ocregister.com/articles/rodriguez-668813-garrity-records.html"
					date: "2015/6/25"
				}
				{
					headline: "Rackauckas will personally oversee informant use"
					url: "http://www.ocregister.com/articles/office-662843-informants-rackauckas.html"
					date: "2015/5/22"
				}
				{
					headline: "Informants an issue again"
					url: "http://www.ocregister.com/articles/ortiz-656615-murder-informant.html"
					date: "2015/4/2"
				}
				{
					headline: "Bar criticizes boycott of judge"
					url: "http://www.ocregister.com/articles/goethals-656332-prosecutors-office.html"
					date: "2015/3/31"
				}
				{
					headline: "Spitzer goes on attack "
					url: "http://www.ocregister.com/articles/attorney-655730-office-spitzer.html"
					date: "2015/3/25"
				}
				{
					headline: "State attorney general appeals Dekraai ruling"
					url: "http://www.ocregister.com/articles/attorney-655115-dekraai-case.html"
					date: "2015/3/21"
				}
				{
					headline: "Families fed up by further delays in Dekraai"
					url: "http://www.ocregister.com/articles/dekraai-654948-attorney-case.html"
					date: "2015/3/20"
				}
				{
					headline: "Gang member facing life will go free"
					url: "http://www.ocregister.com/articles/islas-654929-attorney-cases.html"
					date: "2015/3/19"
				}
				{
					headline: "Errant use of informants disrupts legal system"
					url: "http://www.ocregister.com/articles/informants-654928-prosecutors-cases.html"
					date: "2015/3/19"
				}
				{
					headline: "Rauckackas has always been a fighter"
					url: "http://www.ocregister.com/articles/rackauckas-654482-attorney-case.html"
					date: "2015/3/16"
				}
				{
					headline: " DA says prosecutors erred"
					url: "http://www.ocregister.com/articles/dekraai-654280-prosecutors-attorney.html"
					date: "2015/3/14"
				}
				{
					headline: "Judge kicks DA off Dekraai case"
					url: "http://www.ocregister.com/articles/attorney-654000-county-case.html"
					date: "2015/3/12"
				}
				{
					headline: "Seal Beach shooting case fuels snitch battle"
					url: "http://www.ocregister.com/articles/dekraai-653637-deputies-court.html"
					date: "2015/3/9"
				}
				{
					headline: "Gov. blocks parole for Mexican mafia – leader turned snitch"
					url: "http://www.ocregister.com/articles/parole-651959-informant-police.html"
					date: "2015/2/23"
				}
				{
					headline: "Judge blasts OC deputies secrecy"
					url: "http://www.ocregister.com/articles/system-651540-court-goethals.html"
					date: "2015/2/17"
				}
				{
					headline: "The last time Mexican Mafia leader paroled, two people died"
					url: "http://www.ocregister.com/articles/-651412--.html"
					date: "2015/2/16"
				}
				{
					headline: "Mexican mafia killer turned snitch could walk "
					url: "http://www.ocregister.com/articles/enriquez-651014-mafia-mexican.html"
					date: "2015/2/11"
				}
				{
					headline: "Judge reconsiders ruling, deputies face perjury allegations"
					url: "http://www.ocregister.com/articles/dekraai-650853-deputies-judge.html"
					date: "2015/2/11"
				}
				{
					headline: "Killer gets life sentence cut to 15 years"
					url: "http://www.ocregister.com/articles/vega-650387-attorney-informants.html"
					date: "2015/2/6"
				}
				{
					headline: "Misuse of informants should block death penalty in double-murder case"
					url: "http://www.ocregister.com/articles/sanders-649230-murphy-wozniak.html"
					date: "2015/1/26"
				}
				{
					headline: "Deputies in Dekraai case told to testify again"
					url: "http://www.ocregister.com/articles/dekraai-645032-case-deputies.html"
					date: "2014/12/11"
				}
				{
					headline: "OC Sheriff Hutchens: poor organization"
					url: "http://www.ocregister.com/articles/informants-644455-hutchens-sanders.html"
					date: "2014/12/5"
				}
				{
					headline: "How Mexican Mafia snitches lived like kings in jail"
					url: "http://www.ocregister.com/articles/cuevas-643108-paredes-informants.html"
					date: "2014/11/23"
				}
				{
					headline: "Here is how an admitted killer was set free"
					url: "http://www.ocregister.com/articles/palacios-639481-moriel-informant.html"
					date: "2014/10/22"
				}
				{
					headline: "Judge: DA action negligent in Dekraai case."
					url: "http://www.ocregister.com/articles/dekraai-630582-judge-prosecutors.html"
					date: "2014/8/4"
				}
				{
					headline: "Prosecutors won’t use Dekraai’s taped jailhouse brag"
					url: "http://www.ocregister.com/articles/dekraai-610894-attorney-court.html"
					date: "2014/4/22"
				}
				{
					headline: "Prosecutor says evidence withheld"
					url: "http://www.ocregister.com/articles/wagner-606825-dekraai-allegations.html"
					date: "2014/3/24"
				}
				{
					headline: "Informant denies told to get confessions"
					url: "http://www.ocregister.com/articles/perez-606132-gang-informant.html"
					date: "2014/3/18"
				}
				{
					headline: "Prosecutors deny knowing informants history"
					url: "http://www.ocregister.com/articles/dekraai-604730-perez-goethals.html"
					date: "2014/3/7"
				}
				{
					headline: "Prosecutors: Dekraai talked about Seal Beach shooting"
					url: "http://www.ocregister.com/articles/dekraai-388080-informant-salon.html"
					date: "2013/1/18"
				}
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
				if (_[0] == "/" && _[1] != "/")
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



	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		articles: (database) ->
			database.findAllLive({tags:$has:'article'}, [date:-1])


	# =================================
	# Plugins

	plugins:
		downloader:
			downloads: [
				{
					name: 'Bootstrap'
					path: 'src/files/vendor/twitter-bootstrap'
					url: 'https://codeload.github.com/twbs/bootstrap/tar.gz/master'
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
}


# Export our DocPad Configuration
module.exports = docpadConfig
