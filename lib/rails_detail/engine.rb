require 'rails_com'
module RailsDetail
  class Engine < ::Rails::Engine
    
    config.autoload_paths += Dir[
      "#{config.root}/app/models/content"
    ]

    initializer 'rails_com.add_generator_templates' do |app|
      app.config.paths['lib/templates'].unshift File.expand_path('lib/templates', RailsCom::Engine.root)
    end

    config.generators do |g|
      g.stylesheets false
      g.javasricpts false
      g.javascript_engine false
      g.helper false
      g.jbuilder false
      g.templates.unshift File.expand_path('lib/templates', RailsCom::Engine.root)
    end

  end
end
