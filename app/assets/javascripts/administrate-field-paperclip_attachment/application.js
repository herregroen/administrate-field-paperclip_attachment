var init = function () {
  $('.paperclip-image-upload').change(function () {
    var img = $(this).siblings('img');


    if (img.length > 0 && FileReader && this.files && this.files.length) {
      var self = this;
      var fr = new FileReader();
      fr.onload = function () {
        img[0].src = fr.result;
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
