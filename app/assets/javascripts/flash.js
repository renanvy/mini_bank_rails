var App;

App = window.App = {
  Common: {
    init: function() {},

    finish: function() {},

    flash: function() {
      setTimeout(function() {
        return $('.flash').slideDown('slow');
      }, 100);

      if ($('.flash a').length === 0) {
        setTimeout(function() {
          return $('.flash').slideUp('slow');
        }, 16000);
      }
      
      return $('.flash').click(function() {
        return $('.flash').slideUp();
      });
    }
  }
};