# frozen_string_literal: true

require 'grape'

require_relative '../../helpers/shared_params'

module AlpacaDevice
  module DeviceApi
    module V1
      class CommonApi < Grape::API
        helpers AlpacaDevice::Helpers::SharedParams

        params do
          use :client_transaction_info
        end
        get :connected do
          success_response(
            'Value' => current_ascom_device.connected
          )
        end

        params do
          use :client_transaction_info
        end
        get :description do
          success_response(
            'Value' => current_ascom_device.description
          )
        end

        params do
          use :client_transaction_info
        end
        get :driverinfo do
          success_response(
            'Value' => current_ascom_device.driverinfo
          )
        end

        params do
          use :client_transaction_info
        end
        get :driverversion do
          success_response(
            'Value' => current_ascom_device.driverversion
          )
        end

        params do
          use :client_transaction_info
        end
        get :interfaceversion do
          success_response(
            'Value' => current_ascom_device.interfaceversion
          )
        end

        params do
          use :client_transaction_info
        end
        get :name do
          success_response(
            'Value' => current_ascom_device.name
          )
        end

        params do
          use :client_transaction_info
        end
        get :supportedactions do
          success_response(
            'Value' => current_ascom_device.supportedactions
          )
        end

        params do
          requires :Action, type: String
          requires :Parameters, type: String
          use :client_transaction_info
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
          use :client_transaction_info
        end
        put :commandblind do
          current_ascom_device.set_commandblind(command: params[:Command], raw: params[:Raw])
          success_response
        end

        params do
          requires :Command, type: String
          requires :Raw, type: String
          use :client_transaction_info
        end
        put :commandbool do
          result = current_ascom_device.set_commandbool(command: params[:Command], raw: params[:Raw])
          success_response(
            'Value' => result
          )
        end

        params do
          requires :Command, type: String
          requires :Raw, type: String
          use :client_transaction_info
        end
        put :commandstring do
          result = current_ascom_device.set_commandstring(command: params[:Command], raw: params[:Raw])
          success_response(
            'Value' => result
          )
        end

        params do
          requires :Connected, type: Boolean
          use :client_transaction_info
        end
        put :connected do
          current_ascom_device.set_connected(connected: params[:Connected])
          success_response
        end
      end
    end
  end
end
