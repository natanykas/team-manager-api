# frozen_string_literal: true

class Member < ApplicationRecord
  has_one :type_contract, dependent: :destroy

  validates :name, :salary_per_year, :country, :currency, presence: true

  accepts_nested_attributes_for :type_contract
end
