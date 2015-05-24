TheDetail::Engine.config.paths['db/migrate'].expanded.each do |path|
  Rails.configuration.paths["db/migrate"].push(path)
end

TheDetail::Engine.config.paths['config/locales'].expanded.each do |path|
  Rails.configuration.paths['config/locales'].push(path)
end
