# frozen_string_literal: true

require_relative "alpaca_device/version"
require_relative "alpaca_device/configuration"

module AlpacaDevice
  class Error < StandardError; end

  autoload :DiscoveryService, 'alpaca_device/discovery_service.rb'
  autoload :Api, 'alpaca_device/api'

  module AscomDevices
    autoload :BaseFocuser, 'alpaca_device/ascom_devices/base_focuser'
    autoload :BaseFocuserV3, 'alpaca_device/ascom_devices/base_focuser_v3'
  end

  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end
  end
end
