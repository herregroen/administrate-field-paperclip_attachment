//= require administrate-field-paperclip_attachment/cropper.min

var init = function () {
  $('.paperclip-image-upload').change(function () {
    var img = $(this).siblings('img');

    if (img.length > 0 && FileReader && this.files && this.files.length) {
      var self = this;
      var hidden = $(this).siblings('input[type=hidden]');
      var fr = new FileReader();
      fr.onload = function () {
        img[0].src = fr.result;
        if (img.data('has-cropper')) {
          img.siblings('.cropper-help').show();
          img.cropper({
            aspectRatio: img.data('aspect-ratio'),
            viewMode: 1,
            dragMode: 'move',
            crop: function () {
              hidden.val(img.cropper('getCroppedCanvas').toDataURL());
            }
          });
        }
      }
      fr.readAsDataURL(this.files[0]);
    }
  });
};

if (window['Turbolinks']) {
  document.addEventListener('turbolinks:load', init);
} else {
  $(init);
}
