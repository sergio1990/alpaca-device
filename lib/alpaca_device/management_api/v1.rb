# frozen_string_literal: true

require 'grape'

module AlpacaDevice
  class ManagementApiV1 < Grape::API
    params do
      optional :ClientID, type: Integer, allow_blank: false
      optional :ClientTransactionID, type: Integer, allow_blank: false
    end
    get :description do
      {
        'Value' => {
          'ServerName': '',
          'Manufacturer': '',
          'ManufacturerVersion': '',
          'Location': ''
        },
        'ClientTransactionID' => params[:ClientTransactionID] || 0,
        'ServerTransactionID' => 1
      }
    end


    params do
      optional :ClientID, type: Integer, allow_blank: false
      optional :ClientTransactionID, type: Integer, allow_blank: false
    end
    get :configureddevices do
      {
        'Value' => [],
        'ClientTransactionID' => params[:ClientTransactionID] || 0,
        'ServerTransactionID' => 1
      }
    end
  end
end
