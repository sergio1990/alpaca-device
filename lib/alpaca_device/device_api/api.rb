# frozen_string_literal: true

require 'grape'
require_relative './v1.rb'

module AlpacaDevice
  class DeviceAPI < Grape::API
    mount AlpacaDevice::DeviceApiV1, '/v1'
  end
end
