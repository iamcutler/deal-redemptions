require 'kaminari'

module DealRedemptions
  class Engine < ::Rails::Engine
    isolate_namespace DealRedemptions

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework        :rspec,         :fixture => false
      g.fixture_replacement   :factory_girl,  :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer :assets do |config|
      Rails.application.config.assets.precompile += [ 'deal_redemptions/admin.css', 'deal_redemptions/admin.js' ]
      Rails.application.config.assets.paths << root.join("app", "assets", "images", "fonts")
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end

module DealRedemptions
  # Maps the vars from hosted app into the engine
  def self.configure(&block)
    @@config ||= DealRedemptions::Engine::Configuration.new

    # Default vars if not overwritten
    @@config.site_name = 'Deal Site Redemptions'
    @@config.welcome_notice = 'Please select a deal site to redeem your voucher:'
    @@config.logo = '/assets/deal-redemptions-logo.png'
    # Admin panel default enabled
    @@config.admin_interface = true
    @@config.disable_powered = false
    # Custom styling for redemption pages
    @@config.stylesheet = nil
    # Overwrite default email for notifications and redemptions
    @@config.email_address = 'noreply@domain.com'

    yield @@config if block

    return @@config
  end

  def self.config
    Rails.application.config
  end
end
