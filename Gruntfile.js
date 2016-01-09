module.exports = function(grunt) {
	grunt.initConfig({
		uglify: {
			dist: {
				src: [
					'out/vendor/twitter-bootstrap/dist/js/bootstrap.js',
					'out/vendor/social-share-kit/js/social-share-kit.js',
					'out/scripts/autocrop.js',
					'out/scripts/script.js',
					'out/scripts/slideshow.js',
					'out/vendor/smartcrop.js',
					'out/vendor/photoswipe/photoswipe-ui-default.js',
					'out/vendor/photoswipe/photoswipe.js'],
				dest: 'out/scripts/built.min.js'
			}
		}
	});
	// Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
  
    // Default task(s).
    grunt.registerTask('default', ['uglify']);
};