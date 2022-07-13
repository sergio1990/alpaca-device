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

        get :description do
          success_response(
            'Value' => current_ascom_device.description
          )
        end

        get :driverinfo do
          success_response(
            'Value' => current_ascom_device.driverinfo
          )
        end

        get :driverversion do
          success_response(
            'Value' => current_ascom_device.driverversion
          )
        end

        get :interfaceversion do
          success_response(
            'Value' => current_ascom_device.interfaceversion
          )
        end

        get :name do
          success_response(
            'Value' => current_ascom_device.name
          )
        end

        get :supportedactions do
          success_response(
            'Value' => current_ascom_device.supportedactions
          )
        end
      end
    end
  end
end
