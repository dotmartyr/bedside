ready = -> 
  $("button[data-type='cancel-button']").live("click", (event) ->
    
    attr = $(this).data("attribute")
  
    $("."+attr+"-container").toggleClass("hidden");
    $("."+attr+"-editable-container").toggleClass("hidden")
  
    $("button[data-type='edit-button'][data-attribute='"+attr+"']").toggle();
    event.preventDefault()
  )
  $("button[data-type='edit-button']").live("click", (event) ->
    
    attr = $(this).data("attribute")
  
    $("."+attr+"-container").toggleClass("hidden");
    $("."+attr+"-editable-container").toggleClass("hidden")
  
    $("button[data-type='edit-button'][data-attribute='"+attr+"']").toggle();
  )
$(document).ready(ready)
$(document).on('page:load', ready)

