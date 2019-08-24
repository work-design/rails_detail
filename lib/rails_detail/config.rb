require 'active_support/configurable'

module RailsDetail
  include ActiveSupport::Configurable

  configure do |config|
    config.mapping = ActiveSupport::OrderedOptions.new

    config.admin_controller = 'AdminController'
    config.my_controller = 'MyController'
    config.mapping.date = { input: 'date', output: 'to_date' }
    config.mapping.integer = { input: 'number', output: 'to_i' }
    config.mapping.string = { input: 'text', output: 'to_s' }
    config.mapping.text = { input: 'textarea', output: 'to_s' }
    config.mapping.array = { input: 'array', output: 'to_s' }
    config.mapping.boolean = { input: 'checkbox', output: 'to_s' }
  end

end
