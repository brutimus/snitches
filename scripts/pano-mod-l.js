jQuery(document).ready(function($) {
	var viewer = new PTGuiViewer();
	viewer.setSwfUrl("http://brutimus.github.io/snitches/scripts/PTGuiViewer.swf");
	viewer.preferHtmlViewer();
	// viewer.preferFlashViewer();
	viewer.setVars({
	  pano: "http://brutimus.github.io/snitches/images/panos/pano_modl/ModL_",
	  format: "14faces",
	  pan: -130,
	  minpan: -180,
	  maxpan: 180,
	  tilt:10,
	  mintilt: -67.42094167252283,
	  maxtilt: 67.42094167252283,
	  fov: 110,
	  minfov: 10,
	  maxfov: 130,
	  autorotatespeed: 0,
	  autorotatedelay: 0,
	  maxiosdimension: 598,
	  showfullscreenbutton_flash: 1,
	  showfullscreenbutton_html: 1,
	  enablegyroscope: 1
	});

	viewer.embed("mypanoviewer");
});