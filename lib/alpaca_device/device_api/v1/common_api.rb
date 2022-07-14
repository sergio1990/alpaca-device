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

        params do
          requires :Action, type: String
          requires :Parameters, type: String
        end
        put :action do
          result = current_ascom_device.set_action(action: params[:Action], parameters: params[:Parameters])
          success_response(
            'Value' => result
          )
        end

        params do
          requires :Command, type: String
          requires :Raw, type: String
        end
        put :commandblind do
          current_ascom_device.set_commandblind(command: params[:Command], raw: params[:Raw])
          success_response
        end
      end
    end
  end
end
