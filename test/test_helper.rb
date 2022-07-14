# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "alpaca_device"

require "minitest/autorun"
require "rack/test"

module RackTestAlpacaDeviceHelpers
  def json_response
    JSON.parse(last_response.body, symbolize_names: true)
  end

  def assert_transaction_info(client_transaction_id)
    assert_equal client_transaction_id.to_s, json_response[:ClientTransactionID].to_s
    refute_nil json_response[:ServerTransactionID]
  end
end

Rack::Test::Methods.send :include, RackTestAlpacaDeviceHelpers

class MockFocuser < AlpacaDevice::AscomDevices::BaseFocuser
  def initialize
    super(name: 'Mock Focuser', uuid: 'uuid')

    @position = 0
    @description = "MockFocuser created specifically for tests"
    @driverinfo = "The driver for the MockFocuser"
    @driverversion = "1.0"
    @interfaceversion = 3
    @supportedactions = []
  end

  def set_tempcomp(tempcomp:)
  end

  def set_halt
  end

  def set_move(position:)
  end

  def set_action(action:, parameters:)
    "#{action}:#{parameters}"
  end

  def set_commandblind(command:, raw:)
  end

  def set_commandbool(command:, raw:)
    false
  end

  def set_commandstring(command:, raw:)
    "pong:#{command}"
  end

  def set_connected(connected:)
  end
end

AlpacaDevice.configure do |config|
  config.register_ascom_device MockFocuser.new

  config.description_name = "SG Alpaca Device"
  config.description_creator = "SG"
  config.description_version = "v1.0"
  config.description_location = "Kyiv, UA"
end
