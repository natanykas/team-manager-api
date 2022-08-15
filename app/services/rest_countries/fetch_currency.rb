# frozen_string_literal: true

module RestCountries
  class FetchCurrency < ApplicationService
    attr_accessor :country

    def initialize(country)
      @country = country
    end

    def execute
      fetch_currency
    end

    private

    def fetch_currency
      response = ::Integrations::RestCountries::FetchCurrency.call(country)

      return { :success => false, :parsed_response_body=> nil } unless response.dig(:success)

      {
        :success => true,
        :parsed_response_body => response.dig(:parsed_response_body, 0, 'currencies')
      }
    end
  end
end
