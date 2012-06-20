module SpreeMailChimp
  class Engine < Rails::Engine
    engine_name 'spree_mail_chimp'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "configure assets", :group => :all do |app|
      app.config.assets.precompile << 'admin/jquery.validate.min.js'
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
