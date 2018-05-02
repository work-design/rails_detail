require 'rails_com'
module TheDetail
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail"]
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail/concerns"]
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail/contents"]

    initializer 'the_detail.assets.precompile' do |app|
      app.config.assets.precompile += ['the_detail_manifest.js']
    end

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
