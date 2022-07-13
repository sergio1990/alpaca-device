# frozen_string_literal: true

require 'grape'

module AlpacaDevice
  module DeviceApi
    module V1
      class CommonApi < Grape::API
        get :connected do
          success_response(
            'Value' => current_ascom_device.connected
          )
        end
      end
    end
  end
end
