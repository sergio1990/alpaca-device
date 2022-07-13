# frozen_string_literal: true

require "test_helper"

class TestAlpacaDevice < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AlpacaDevice::VERSION
  end
end
