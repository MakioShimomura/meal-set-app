class Plan < ApplicationRecord
  has_many :plans, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  scope :default_order, -> { order(:id) }
end
