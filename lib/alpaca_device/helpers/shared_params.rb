require 'grape'

module AlpacaDevice
  module Helpers
    module SharedParams
      extend Grape::API::Helpers

      params :client_transaction_info do
        optional :ClientID, type: Integer, allow_blank: false
        optional :ClientTransactionID, type: Integer, allow_blank: false
      end
    end
  end
end
