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
  var chkbox = $(".add_member");
  var btn = $(".add_members");
  btn.attr("disabled", "disabled");
  chkbox.change(function(){
    if(this.checked){
      btn.removeAttr("disabled");
    } else{
      btn.attr("disabled", "disabled");
    }
  });
};

$(document).on('turbolinks:load', main());
