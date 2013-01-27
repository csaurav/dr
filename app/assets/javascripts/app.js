$(document).ready(function() {
   // put all your jQuery goodness in here.
  	
  	$('a#file_upload').bind('ajax:success', function(evt, data) { 
    	
    	$('div.span6').toggle();
	});

    $('input#import').bind('click', function(){
    	
      var file = $('input[type="file"]').val();
      var exts = ['txt'];
      
      if ( file == '')
      {
      	alert( 'Invalid file!' );
      	return false;
      }
      else
      {	
      	var get_ext = file.split('.');
        // reverse name to check extension
        get_ext = get_ext.reverse();

        if ( $.inArray ( get_ext[0].toLowerCase(), exts ) > -1 ){
          // alert( 'Allowed extension!' );
          // return false;
        } else {
          alert( 'Invalid file!' );
          return false;
        }
      }
      
    });
 });