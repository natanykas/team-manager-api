# frozen_string_literal: true

require './lib/integrations/rest_countries/base_request'

module Integrations
  module RestCountries
    class FetchCurrency < BaseRequest
      attr_accessor :country

      def initialize(country)
        @country = country

        super
      end

      def call
        send_request
      end

      private

      def http_method
        :get
      end

      def action
        "/name/#{country}"
      end
    end
  end
end
