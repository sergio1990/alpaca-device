# frozen_string_literal: true

require 'grape'

module AlpacaDevice
  module DeviceApi
    module V1
      class FocuserApi < Grape::API
        helpers do
          def current_ascom_type
            AlpacaDevice::AscomDevices::Type::FOCUSER
          end
        end

        get :position do
          success_response(
            'Value' => current_ascom_device.position
          )
        end
      end
    end
  end
end
