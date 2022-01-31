# frozen_string_literal: true

require_relative "alpaca_device/version"
require_relative "alpaca_device/configuration"

module AlpacaDevice
  class Error < StandardError; end

  autoload :DiscoveryService, 'alpaca_device/discovery_service'

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end
  end
end
