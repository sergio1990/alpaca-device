require "test_helper"

class TestDeviceApiV1 < Minitest::Test
  include Rack::Test::Methods

  def app
    AlpacaDevice::Api
  end

  def test_connected
    get '/api/v1/focuser/0/connected', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_position
    get '/api/v1/focuser/0/position', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 0, value
  end
end
