// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Element = {
  replace: function(elem, data) {
    $("#" + elem).replaceWith(data);
  },
  remove: function(elem) {
    $("#" + elem).remove();
  }
};