// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $("table#loans_table td.desc").click(function() {
    go_to_edit_loan($(this).parent().attr('id'));
  });
  $("table#loans_table tr").hover(function() {
     $(this).addClass("current_line");
   },function(){
     $(this).removeClass("current_line");
   });
});