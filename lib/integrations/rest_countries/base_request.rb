# frozen_string_literal: true

require './lib/integrations/rest_countries/api'

module Integrations
  module RestCountries
    class BaseRequest
      attr_accessor :result

      def initialize(*_args)
        @result = {}
      end

      def self.call(*args, **kwargs, &block)
        submit = new(*args, **kwargs)

        submit.call(&block)
      end

      def call
        raise NotImplementedError
      end

      private

      def http_method
        raise NotImplementedError
      end

      def action
        raise NotImplementedError
      end

      def send_request(payload = {}, headers = {})
        request, response = ::Integrations::RestCountries::Api.new(http_method, action, payload, headers).call

        handle_response(request, response)
      rescue RestClient::ExceptionWithResponse => e
        handle_exception(request, e, e.http_body)
      rescue StandardError => e
        handle_exception(request, e)
      end

      def handle_response(request, response)
        {
          request:              request,
          success:              response.code == 200,
          parsed_response_body: JSON.parse(response.body),
          response:             response
        }
      end

      def handle_exception(request, exception, response_body = nil)
        {
          request:                request,
          success:                false,
          parsed_response_body:   response_body ? JSON.parse(response_body) : nil,
          exception_class:        exception.class.to_s,
          exception_message:      exception.message,
          exception_full_message: exception.full_message
        }
      end
    end
  end
end
