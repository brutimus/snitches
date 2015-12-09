(function() {
  SocialShareKit.init();

  (function($) {
    return $(window).scroll(function(e) {
      var i;
      $(window).off('scroll');
      i = $('.lead-container img');
      return i.attr('src', i.data('gifsrc'));
    });
  })(jQuery);

}).call(this);
