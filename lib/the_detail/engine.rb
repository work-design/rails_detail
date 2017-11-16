module TheDetail
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail"]
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail/concerns"]
    config.eager_load_paths += Dir["#{config.root}/app/models/model_detail/contents"]

    initializer 'the_detail.assets.precompile' do |app|
      app.config.assets.precompile += ['the_detail_manifest.js']
    end

  end
end
