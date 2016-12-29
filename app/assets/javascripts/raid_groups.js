main = function(){
  listSearch();
  buttonCheck();
}

listSearch = function(){
  var options = {
    valueNames: [ 'name' ]
  };

  var userList = new List('members', options);
}

buttonCheck = function(){
  var chkbox = $(".add_member"),
        btn = $(".add_members");
  btn.attr("disabled", "disabled");
  chkbox.change(function(){
    if($(".add_member:checkbox:checked").length > 0){
      btn.removeAttr("disabled");
    } else{
      btn.attr("disabled", "disabled");
    }
  });
};

$(document).on('turbolinks:load', main());
