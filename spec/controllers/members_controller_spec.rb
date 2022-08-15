# frozen_string_literal: true

require './app/controllers/members_controller'

describe MembersController, type: :request do
  describe 'GET /members' do
    context 'with members' do
      let(:currency) {
        {
          'BRL': {
              'name': 'Brazilian real',
              'symbol': 'R$'
          }
        }
      }
      let!(:member) { Member.new(name: 'New Member', salary_per_year: 10000, country:'brazil', currency: currency, tags:["ruby-on-rails", "react"]) }
      let!(:type_contract) { TypeContract.new(name: 0, duration: 12, role: 0, member: member) }

      let(:expected_response_data) do
        {
          'member': {
              'id': 1,
              'name': 'New Member',
              'salary_per_year': '100000.0',
              'country': 'brazil',
              'currency': {
                  'BRL': {
                      'name': 'Brazilian real',
                      'symbol': 'R$'
                  }
              },
              'tags': [
                  'ruby-on-rails',
                  'react'
              ],
              'created_at': Member.last.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
              'updated_at': Member.last.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
          }
        }
      end

      before { get('/members') }

      it { expect(member.save).to be_true }
      it { expect(response).to match(expected_response_data) }
    end
  end
end
