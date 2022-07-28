# frozen_string_literal: true

require "test_helper"

class TestBaseFocuserV3 < Minitest::Test
  def test_default_values
    focuser = AlpacaDevice::AscomDevices::BaseFocuserV3.new(
      name: "TestBaseFocuserV3",
      uuid: "uuid"
    )

    assert_equal 3, focuser.interfaceversion
    assert focuser.supportedactions.empty?
    assert_equal 0, focuser.position
    refute focuser.connected
    assert_equal "TestBaseFocuserV3", focuser.name
    assert_equal "uuid", focuser.uuid
  end
end

