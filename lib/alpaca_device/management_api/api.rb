# frozen_string_literal: true

require 'grape'
require_relative './v1.rb'

module AlpacaDevice
  class ManagementAPI < Grape::API
    mount AlpacaDevice::ManagementApiV1 => '/v1'

    params do
      optional :ClientID, type: Integer, allow_blank: false
      optional :ClientTransactionID, type: Integer, allow_blank: false
    end
    get :apiversions do
      {
        'Value' => [1, 2, 3, 4],
        'ClientTransactionID' => params[:ClientTransactionID] || 0,
        'ServerTransactionID' => server_transaction_id
      }
    end
  end
end
