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

  #register live handler for the wishlist checkboxes
  $(".wish input").live "click", (event) ->
    console.log "got the wishlist click"
    console.log $(event.target).parents("form").submit()

  window.Bedside.updatePhoto = (event) ->
    #TODO: update only the relevant partial here
    $('#upload-form form').submit();

$(document).ready(ready)
$(document).on('page:load', ready)

toggleViewEdit = (sectionId) -> 
  
    $("."+sectionId+"-container").toggleClass("hidden");
    $("."+sectionId+"-editable-container").toggleClass("hidden")
  
    $("button[data-type='edit-button'][data-attribute='"+sectionId+"']").toggle();



