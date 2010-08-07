// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(document).ready(function() {
  jQuery("table#loans_table td.desc").click(function() {
    go_to_edit_loan(jQuery(this).parent().attr('id'));
  });
  jQuery("table#loans_table tr").hover(function() {
     jQuery(this).addClass("current_line");
   },function(){
     jQuery(this).removeClass("current_line");
   });
});