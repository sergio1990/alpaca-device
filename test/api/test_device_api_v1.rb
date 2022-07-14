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

  def test_description
    get '/api/v1/focuser/0/description', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal "MockFocuser created specifically for tests", value
  end

  def test_driverinfo
    get '/api/v1/focuser/0/driverinfo', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal "The driver for the MockFocuser", value
  end

  def test_driverversion
    get '/api/v1/focuser/0/driverversion', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal "1.0", value
  end

  def test_interfaceversion
    get '/api/v1/focuser/0/interfaceversion', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 3, value
  end

  def test_name
    get '/api/v1/focuser/0/name', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal "Mock Focuser", value
  end

  def test_supportedactions
    get '/api/v1/focuser/0/supportedactions', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
  end

  def test_action
    put '/api/v1/focuser/0/action', {
      :Action => 'test',
      :Parameters => 'parameters',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    assert_equal "test:parameters", value
  end

  def test_action_bad_request
    put '/api/v1/focuser/0/action', {
      :Parameters => 'parameters',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end

  def test_commandblind
    put '/api/v1/focuser/0/commandblind', {
      :Command => 'test',
      :Raw => 'true',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)
  end

  def test_commandblind_bad_request
    put '/api/v1/focuser/0/commandblind', {
      :Command => 'test',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end

  def test_commandbool
    put '/api/v1/focuser/0/commandbool', {
      :Command => 'testbool',
      :Raw => 'true',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_commandbool_bad_request
    put '/api/v1/focuser/0/commandbool', {
      :Command => 'testbool',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end

  def test_commandstring
    put '/api/v1/focuser/0/commandstring', {
      :Command => 'teststring',
      :Raw => 'true',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal "pong:teststring", value
  end

  def test_commandstring_bad_request
    put '/api/v1/focuser/0/commandstring', {
      :Command => 'teststring',
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end

  def test_setconnected
    put '/api/v1/focuser/0/connected', {
      :Connected => true,
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
  end

  def test_setconnected_bad_request
    put '/api/v1/focuser/0/connected', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end
end
