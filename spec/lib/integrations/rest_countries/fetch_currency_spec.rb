# frozen_string_literal: true

require './lib/integrations/rest_countries/fetch_currency'

describe Integrations::RestCountries::FetchCurrency, type: :request do
  describe 'when we fetch ar links' do
    subject { described_class.call(country) }

    let(:country) { 'brasil' }
    let(:body) { JSON.parse(File.read("spec/fixtures/responses/fetch_currency_success.json")).to_json }

    before do
      allow(Integrations::RestCountries::FetchCurrency).to(
        receive(:call).and_return(body)
      )
    end

    context 'with a valid response' do
      it { expect(subject).to match('Brazilian real') }
    end

    context 'with a invalid response' do
      let(:body) { JSON.parse(File.read("spec/fixtures/responses/fetch_currency_error.json")).to_json }

      it { expect(subject).to match('404 Not Found') }
    end
  end
end
