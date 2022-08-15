# frozen_string_literal: true

module Integrations
  module RestCountries
    class Api
      API_BASE_URL = 'https://restcountries.com'

      attr_reader :http_method, :action, :payload, :headers

      def initialize(http_method, action, payload = {}, headers = {})
        @http_method = http_method
        @action = action
        @payload = payload
        @headers = headers
      end

      def call
        request = RestClient::Request.new(request_options)

        [request, request.execute]
      end

      private

      def request_options
        {
          method:  http_method,
          url:     url,
          payload: payload,
          headers: headers
        }
      end

      def base_url
        "#{API_BASE_URL}/v3.1"
      end

      def url
        base_url + action
      end
    end
  end
end
