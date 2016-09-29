HTMLWidgets.widget({
  name: 'geopattern',
  type: 'output',

  factory: function(el, width, height) {
    var jquery_element = $(el);
    return {

      renderValue: function(x) {
       jquery_element.geopattern(x.string);
      },

      resize: function(width, height) {

      }

    };
  }
});
