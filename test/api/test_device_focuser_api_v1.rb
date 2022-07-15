require "test_helper"

class TestDeviceFocuserApiV1 < Minitest::Test
  include Rack::Test::Methods

  def app
    AlpacaDevice::Api
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

  def test_absolute
    get '/api/v1/focuser/0/absolute', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_ismoving
    get '/api/v1/focuser/0/ismoving', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_maxincrement
    get '/api/v1/focuser/0/maxincrement', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 100, value
  end

  def test_maxstep
    get '/api/v1/focuser/0/maxstep', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 65535, value
  end

  def test_stepsize
    get '/api/v1/focuser/0/stepsize', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 4, value
  end

  def test_tempcomp
    get '/api/v1/focuser/0/tempcomp', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_set_tempcomp
    put '/api/v1/focuser/0/tempcomp', {
      :TempComp => true,
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)
  end

  def test_set_tempcomp_failure
    put '/api/v1/focuser/0/tempcomp', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end

  def test_tempcompavailable
    get '/api/v1/focuser/0/tempcompavailable', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal false, value
  end

  def test_temperature
    get '/api/v1/focuser/0/temperature', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
    assert_transaction_info(890)

    value = json_response[:Value]

    refute_nil value
    assert_equal 20, value
  end

  def test_set_halt
    put '/api/v1/focuser/0/halt', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
  end

  def test_set_move
    put '/api/v1/focuser/0/move', {
      :Position => 300,
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    assert last_response.ok?
  end

  def test_set_move_failure
    put '/api/v1/focuser/0/move', {
      :ClientID => 123,
      :ClientTransactionID => 890
    }
    refute last_response.ok?
  end
end
