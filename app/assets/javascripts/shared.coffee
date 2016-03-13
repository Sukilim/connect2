$ ->
  shownPopup = false
  $modal = $('#modal')
  $popup = $('#popup')

  showPopup = (modal, content) ->
    if !content.length
      return false
    modalSize = content.data('modal') or content.find('.modal-body').data('modal') or ''
    # if a BS modal is active, hide
    modal.modal 'hide'
    # reset BS modal size based on new modal value
    if modalSize.length
      modal.find('.modal-dialog').removeClass('modal-sm modal-lg').addClass modalSize
    # replace BS modal content with popup content
    modal.find('.modal-content').html content.html()
    modal.modal 'show'
    return

  # if we detect there's a popup content on load
  if $popup.length
    popupTrigger = $popup.data('trigger') or ''
    # wait for trigger, or show instantly if no trigger specified
    if popupTrigger.length
      $popup.on popupTrigger, ->
        showPopup $modal, $popup
        return
    else
      showPopup $modal, $popup
