# frozen_string_literal: true

require 'grape'

require_relative './common_api.rb'

module AlpacaDevice
  module DeviceApi
    module V1
      class FocuserApi < Grape::API
        params do
          requires :device_number, type: Integer
        end
        namespace 'focuser/:device_number' do
          mount CommonApi

          get :position do

          end
        end
      end
    end
  end
end
