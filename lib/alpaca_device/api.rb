# frozen_string_literal: true

require 'grape'

require_relative './management_api/api.rb'
require_relative './device_api/api.rb'
require_relative './helpers/api_helper'

module AlpacaDevice
  class Api < Grape::API
    format :json

    helpers AlpacaDevice::Helpers::ApiHelper

    mount ::AlpacaDevice::ManagementAPI => '/management'
    mount ::AlpacaDevice::DeviceAPI => '/api'

    get :ping do
      {text: "pong"}
    end
  end
end
