//= require input-attachment

class HelloController extends Stimulus.Controller {
  greet() {
    console.log("Hellos, Stimulus!", this.element)
  }

  connect() {
    console.log("Connects, Stimulus!", this.element)
    var self = this;
    attachToPreview({
      fileInput: 'picture_file'
    });
  }
}
HelloController.targets = ['src']
const application = Stimulus.Application.start()
application.register('attachment', HelloController)
