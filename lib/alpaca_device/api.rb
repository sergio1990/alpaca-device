# frozen_string_literal: true

require 'grape'

require_relative './management_api/api.rb'
require_relative './device_api/api.rb'

module AlpacaDevice
  class Api < Grape::API
    format :json

    mount ::AlpacaDevice::ManagementAPI => '/management'
    mount ::AlpacaDevice::DeviceAPI => '/api'

    get :ping do
      {text: "pong"}
    end
  end
end
