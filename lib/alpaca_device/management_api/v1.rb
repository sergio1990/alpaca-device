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
          'ServerName': AlpacaDevice.config.description_name,
          'Manufacturer': AlpacaDevice.config.description_creator,
          'ManufacturerVersion': AlpacaDevice.config.description_version,
          'Location': AlpacaDevice.config.description_location
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
      registered_ascom_devices = AlpacaDevice.config.registered_ascom_devices_info
      devices_api_output = registered_ascom_devices.map do |configured_device|
        {
          'DeviceName' => configured_device.name,
          'DeviceType' => configured_device.type,
          'DeviceNumber' => configured_device.number,
          'UniqueID' => configured_device.uuid
        }
      end
      {
        'Value' => devices_api_output,
        'ClientTransactionID' => params[:ClientTransactionID] || 0,
        'ServerTransactionID' => 1
      }
    end
  end
end
