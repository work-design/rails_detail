module TheDetail
  class Engine < ::Rails::Engine
    config.eager_load_paths += Dir["#{TheDetail::Engine.config.root}/app/models/contents"]

    initializer 'the_detail.assets.precompile' do |app|
      app.config.assets.precompile += ['the_detail_manifest.js']
    end

  end
end
