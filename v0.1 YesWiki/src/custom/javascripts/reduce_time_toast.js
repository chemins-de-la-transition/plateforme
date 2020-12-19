var toastMessage = function(message) {
  var $toast = $('<div class="toast-message"><div class="alert alert-secondary-1">' + message + '</div></div>');
  $('body').after($toast);
  $toast.css('top', $('#yw-topnav').outerHeight(true) + 20 + 'px');
  $toast.css('opacity', 1);
  setTimeout(function() { $toast.css('opacity', 0) }, 3000);
  setTimeout(function() { $toast.remove() }, 4000);
  $toast.addClass('visible');
}