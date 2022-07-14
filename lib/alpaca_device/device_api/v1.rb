# frozen_string_literal: true

require 'grape'

require_relative './v1/focuser_api.rb'
require_relative './v1/common_api.rb'
require_relative '../ascom_devices/types'

module AlpacaDevice
  class DeviceApiV1 < Grape::API
    params do
      requires :device_type, type: String, values: AlpacaDevice::AscomDevices::Type::ALL.map(&:downcase)
      requires :device_number, type: Integer
    end
    namespace ':device_type/:device_number' do
      helpers do
        def current_ascom_type
          AlpacaDevice::AscomDevices::Type.convert(raw: params[:device_type])
        end
      end

      mount AlpacaDevice::DeviceApi::V1::CommonApi
    end

    params do
      requires :device_number, type: Integer
    end
    mount AlpacaDevice::DeviceApi::V1::FocuserApi => '/focuser/:device_number'
  end
end
