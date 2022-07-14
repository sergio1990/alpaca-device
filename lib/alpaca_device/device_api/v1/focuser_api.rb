# frozen_string_literal: true

require 'grape'

require_relative './common_api.rb'

module AlpacaDevice
  module DeviceApi
    module V1
      class FocuserApi < Grape::API
        helpers do
          def current_ascom_type
            AlpacaDevice::AscomDevices::Type::FOCUSER
          end
        end

        params do
          requires :device_number, type: Integer
        end
        namespace 'focuser/:device_number' do
          mount CommonApi

          get :position do
            success_response(
              'Value' => current_ascom_device.position
            )
          end
        end
      end
    end
  end
end
