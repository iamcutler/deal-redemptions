module DealRedemptions
  class Engine < ::Rails::Engine
    isolate_namespace DealRedemptions
  end
end

module DealRedemptions
  # Maps the vars from hosted app into the engine
  def self.configure(&block)
    @@config ||= DealRedemptions::Engine::Configuration.new

    # Default vars if not overwritten
    @@config.site_name = 'Deal Site Redemptions'
    @@config.logo = '/assets/logo.png'

    yield @@config if block

    return @@config
  end

  def self.config
    Rails.application.config
  end
end
