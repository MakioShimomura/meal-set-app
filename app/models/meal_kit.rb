class MealKit < ApplicationRecord
  belongs_to :plan

  validates :name, presence: true
  validates :price, numericality: { only_integer: true }
  validates :meal_content, presence: true

  scope :default_order, -> { order(:id) }
end
