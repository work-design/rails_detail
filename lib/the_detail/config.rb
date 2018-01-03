require 'active_support/configurable'

module TheDetail
  include ActiveSupport::Configurable

  configure do |config|
    config.mapping = ActiveSupport::OrderedOptions.new

    config.admin_class = 'Admin::BaseController'
    config.my_class = 'My::BaseController'
    config.mapping.date = { input: 'date', output: 'to_date' }
    config.mapping.integer = { input: 'number', output: 'to_i' }
    config.mapping.string = { input: 'text', output: 'to_s' }
    config.mapping.text = { input: 'textarea', output: 'to_s' }
    config.mapping.array = { input: 'array', output: 'to_s' }
  end

end