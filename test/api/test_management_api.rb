require "test_helper"

class TestManagementApi < Minitest::Test
  include Rack::Test::Methods

  def app
    AlpacaDevice::Api
  end

  def test_ping
    get '/ping'
    assert last_response.ok?
    assert_equal 'pong', json_response[:text]
  end

  def test_apiversions
    get '/management/apiversions', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    refute_nil json_response[:Value]
  end

  def test_v1_description
    get '/management/v1/description', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    assert_equal "SG Alpaca Device", value[:ServerName]
    assert_equal "SG", value[:Manufacturer]
    assert_equal "v1.0", value[:ManufacturerVersion]
    assert_equal "Kyiv, UA", value[:Location]
  end

  def test_v1_configureddevices
    get '/management/v1/configureddevices', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert value.count == 1

    mock_focuser = value.first

    assert_equal "Mock Focuser", mock_focuser[:DeviceName]
    assert_equal "Focuser", mock_focuser[:DeviceType]
    assert_equal 0, mock_focuser[:DeviceNumber]
    assert_equal "uuid", mock_focuser[:UniqueID]
  end
end
