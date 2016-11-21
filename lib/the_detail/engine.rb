module TheDetail
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{TheDetail::Engine.config.root}/app/models/contents"]
  end
end
