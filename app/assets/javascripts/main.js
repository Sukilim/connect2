// Reusable modal with UJS
// Use different modal size by using data-modal
$(document).on("ajax:complete", ".modal-toggle", function(event, xhr, status){
  var $modal = $("#modal"),
      modalSize = $(this).data("modal") || "";

  if (modalSize.length) $modal.find(".modal-dialog").addClass(modalSize);

  $modal.find(".modal-content").html(xhr.responseText);
  $modal.modal("show");
});

// On modal hidden, reset content
// Reload if indicated by data-reload
$(document).on("hidden.bs.modal", "#modal", function(){
  var reload = $(this).find(".modal-body").data("reload");

  $(this).find(".modal-dialog")
    .removeClass("modal-sm modal-lg")
    .find(".modal-content").html("");

  if (reload) {
    window.location.reload();
  }
});