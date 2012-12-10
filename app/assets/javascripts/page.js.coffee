ready = ->
  # set up a global "bedside" namespace
  window.Bedside = {}

  # register live handler for the save buttons in the page details section
  $("input[data-type='save-button']").live("click", (event) ->
    
    attr = $(this).data("attribute")
  
    toggleViewEdit(attr)
  )

  # register live handler for the cancel buttons in the page details section
  $("button[data-type='cancel-button']").live("click", (event) ->
    
    attr = $(this).data("attribute")
  
    toggleViewEdit(attr)
    
    event.preventDefault()
  )
  #register live handler for the edit buttons in the page details section
  $("button[data-type='edit-button']").live("click", (event) ->
    
    attr = $(this).data("attribute")
  
    toggleViewEdit(attr)
  )
  window.Bedside.updatePhoto = (event) ->
    #TODO: update the page with AJAX here, which returns the 
    #html and js to update the photo area
    console.log(event)

$(document).ready(ready)
$(document).on('page:load', ready)

toggleViewEdit = (sectionId) -> 
  
    $("."+sectionId+"-container").toggleClass("hidden");
    $("."+sectionId+"-editable-container").toggleClass("hidden")
  
    $("button[data-type='edit-button'][data-attribute='"+sectionId+"']").toggle();



