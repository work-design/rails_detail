//= require input-attachment

class HelloController extends Stimulus.Controller {
  greet() {
    console.log("Hellos, Stimulus!", this.element)
  }

  connect() {
    console.log("Connects, Stimulus!", this.element)
    var self = this;
    attachToInput({
      input: 'picture_body',
      fileInput: 'picture_file',
      uploadUrl: window.location.pathname + '/' + self.element.dataset['id'],
      uploadFieldName: 'picture[file]',
      extraParams: {
        token: '',
        _method: 'patch'
      },
      extraHeaders: {
        'Accept': 'application/json',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      onFileUploaded: function (filename) {
        self.srcTargets[0].src = filename
      }
    });
  }
}
HelloController.targets = ['src']
const application = Stimulus.Application.start()
application.register('attachment', HelloController)
