# frozen_string_literal: true

require 'grape'
require_relative './v1.rb'
require_relative '../helpers/shared_params'

module AlpacaDevice
  class ManagementAPI < Grape::API
    mount AlpacaDevice::ManagementApiV1 => '/v1'

    helpers AlpacaDevice::Helpers::SharedParams

    params do
      use :client_transaction_info
    end
    get :apiversions do
      {
        'Value' => [1],
        'ClientTransactionID' => params[:ClientTransactionID] || 0,
        'ServerTransactionID' => server_transaction_id
      }
    end
  end
end
