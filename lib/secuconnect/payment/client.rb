module Secuconnect
  module Payment
    class Client
      include Secuconnect::Connection
      include Secuconnect::Authenticated

      private

      def headers
        { 
          "Content-Type": "application/json",
          "Authorization": "Bearer #{access_token}"
        }
      end

      def access_token
        Secuconnect::Oauth2::Token.new.find_or_create
      end
    end
  end
end