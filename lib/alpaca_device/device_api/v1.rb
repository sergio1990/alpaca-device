# frozen_string_literal: true

require 'grape'

require_relative './v1/focuser_api.rb'

module AlpacaDevice
  class DeviceApiV1 < Grape::API
    mount AlpacaDevice::DeviceApi::V1::FocuserApi
  end
end
