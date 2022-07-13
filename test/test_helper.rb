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
  def set_tempcomp(tempcomp:)
  end

  def set_halt
  end

  def set_move(position:)
  end
end

AlpacaDevice.configure do |config|
  config.register_ascom_device MockFocuser.new(name: 'Mock Focuser', uuid: 'uuid')

  config.description_name = "SG Alpaca Device"
  config.description_creator = "SG"
  config.description_version = "v1.0"
  config.description_location = "Kyiv, UA"
end
