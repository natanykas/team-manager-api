class TypeContract < ApplicationRecord
  ROLE_TYPE = %w[software_engineer project_manager].freeze

  NAME_TYPE = %w[contractor employee].freeze

  belongs_to :member, optional: false

  validates :name, :duration, :role, presence: true

  enum role: ROLE_TYPE

  enum name: NAME_TYPE
end
