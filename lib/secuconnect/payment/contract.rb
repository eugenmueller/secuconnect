# frozen_string_literal: true

module Secuconnect
  module Payment
    class Contract < Client
      def index
        response = connection.get(base_path)

        handle_response(__method__, response)
      end

      def show(account_id:)
        path = "#{base_path}/#{account_id}"
        response = connection.get(path)

        handle_response(__method__, response)
      end

      def create(account_id:, body:)
        path = "#{base_path}/#{account_id}/RequestID"
        response = connection.post(path, body.to_json)

        handle_response(__method__, response)
      end

      def validate(account_id:)
        path = "#{base_path}/#{account_id}"
        response = connection.get(path)

        raise ResponseError.new(response), "#{action.capitalize} response error" unless response.success?

        response.success?
      end

      private

      def handle_response(action, response)
        raise ResponseError.new(response), "#{action.capitalize} response error" unless response.success?

        JSON.parse(response.body)
      end

      def base_path
        "#{API_PATH_PREFIX}/Payment/Contracts"
      end
    end
  end
end
