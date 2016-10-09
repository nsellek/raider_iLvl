$(document).on('turbolinks:load', function() {
  var options = {
    valueNames: [ 'name' ]
  };

  var userList = new List('members', options);
});
