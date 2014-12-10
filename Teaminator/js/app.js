// Generated by CoffeeScript 1.7.1
$(function() {
  return $('form').submit(function(e) {
    var group, groupHTML, groups, groupsHTML, person, twitterHandle, twitterHandles;
    e.preventDefault();
    twitterHandles = (function() {
      var _i, _len, _ref, _results;
      _ref = $(this).find('textarea').val().split(',');
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        twitterHandle = _ref[_i];
        _results.push($.trim(twitterHandle));
      }
      return _results;
    }).call(this);
    groups = Teaminator.groupRandomly(twitterHandles);
    groupsHTML = (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = groups.length; _i < _len; _i++) {
        group = groups[_i];
        groupHTML = (function() {
          var _j, _len1, _results1;
          _results1 = [];
          for (_j = 0, _len1 = group.length; _j < _len1; _j++) {
            person = group[_j];
            _results1.push("<li>" + person + "</li>");
          }
          return _results1;
        })();
        _results.push("<li><ul>" + (groupHTML.join('')) + "</ul></li>");
      }
      return _results;
    })();
    return $('#result').html("<ul>" + (groupsHTML.join('')) + "</ul>");
  });
});