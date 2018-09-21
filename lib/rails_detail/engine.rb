require 'rails_com'
module RailsDetail
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir[
      "#{config.root}/app/models/rails_detail",
      "#{config.root}/app/models/rails_detail/concerns",
      "#{config.root}/app/models/rails_detail/contents"
    ]

    initializer 'rails_detail.assets.precompile' do |app|
      app.config.assets.precompile += ['rails_detail_manifest.js']
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
