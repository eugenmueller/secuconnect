# frozen_string_literal: true

module Secuconnect
  module Payment
    class Contract < Client
      def index
        response = connection.get(base_path)
        JSON.parse(response.body)
      end

      def show(account_id:)
        path = "#{base_path}/#{account_id}"
        connection.get(path)
      end

      def create(account_id:, body:)
        path = "#{base_path}/#{account_id}/RequestID"
        connection.post(path, body.to_json)
      end

      def validate(account_id:)
        path = "#{base_path}/#{account_id}"
        connection.get(path).success?
      end

      private

      def base_path
        "api/v2/Payment/Contracts"
      end
    end
  end
end
