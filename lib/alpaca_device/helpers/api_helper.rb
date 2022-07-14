module AlpacaDevice
  module Helpers
    module ApiHelper
      TRANSACTION_MAX_VALUE = 4294967295

      def server_transaction_id
        (rand() * TRANSACTION_MAX_VALUE).round
      end

      def fetch_device(type, number)
        AlpacaDevice.config.ascom_device(type, number)
      end

      def success_response(response_hash = {})
        with_common_response(response_hash, 0, "")
      end

      def with_common_response(response_hash, error_number, error_message)
        response_hash
          .then { add_transaction_info(_1) }
          .then { add_error_info(_1, error_number, error_message) }
      end

      def add_transaction_info(response_hash)
        response_hash.merge(
          'ClientTransactionID' => params[:ClientTransactionID] || 0,
          'ServerTransactionID' => server_transaction_id
        )
      end

      def add_error_info(response_hash, number, message)
        response_hash.merge(
          'ErrorNumber' => number,
          'ErrorMessage' => message
        )
      end
    end
  end
end
