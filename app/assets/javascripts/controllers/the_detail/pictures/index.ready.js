//= require input-attachment

class HelloController extends Stimulus.Controller {
  greet() {
    console.log("Hello, Stimulus!", this.element)
  }

  connect() {
    console.log("Connect, Stimulus!", this.element)
  }
}
const application = Stimulus.Application.start()
application.register('hello', HelloController)