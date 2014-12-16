module Cache
  class Railtie < ::Rails::Railtie
    initializer 'cache.config' do |app|
      app.config.paths.add 'app/caches', eager_load: true
    end
  end
end
