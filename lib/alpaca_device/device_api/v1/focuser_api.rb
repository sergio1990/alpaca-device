# frozen_string_literal: true

require 'grape'

require_relative '../../helpers/shared_params'

module AlpacaDevice
  module DeviceApi
    module V1
      class FocuserApi < Grape::API
        helpers AlpacaDevice::Helpers::SharedParams
        helpers do
          def current_ascom_type
            AlpacaDevice::AscomDevices::Type::FOCUSER
          end
        end

        params do
          use :client_transaction_info
        end
        get :position do
          success_response(
            'Value' => current_ascom_device.position
          )
        end

        params do
          use :client_transaction_info
        end
        get :absolute do
          success_response(
            'Value' => current_ascom_device.absolute
          )
        end

        params do
          use :client_transaction_info
        end
        get :ismoving do
          success_response(
            'Value' => current_ascom_device.ismoving
          )
        end

        params do
          use :client_transaction_info
        end
        get :maxincrement do
          success_response(
            'Value' => current_ascom_device.maxincrement
          )
        end

        params do
          use :client_transaction_info
        end
        get :maxstep do
          success_response(
            'Value' => current_ascom_device.maxstep
          )
        end

        params do
          use :client_transaction_info
        end
        get :stepsize do
          success_response(
            'Value' => current_ascom_device.stepsize
          )
        end

        params do
          use :client_transaction_info
        end
        get :tempcomp do
          success_response(
            'Value' => current_ascom_device.tempcomp
          )
        end

        params do
          requires :TempComp, type: Boolean
          use :client_transaction_info
        end
        put :tempcomp do
          current_ascom_device.set_tempcomp(tempcomp: params[:TempComp])
          success_response
        end

        params do
          use :client_transaction_info
        end
        get :tempcompavailable do
          success_response(
            'Value' => current_ascom_device.tempcompavailable
          )
        end

        params do
          use :client_transaction_info
        end
        get :temperature do
          success_response(
            'Value' => current_ascom_device.temperature
          )
        end

        params do
          use :client_transaction_info
        end
        put :halt do
          current_ascom_device.set_halt
          success_response
        end

        params do
          requires :Position, type: Integer
          use :client_transaction_info
        end
        put :move do
          current_ascom_device.set_move(position: params[:Position])
          success_response
        end
      end
    end
  end
end
