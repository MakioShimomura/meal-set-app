class Order < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %i[initial shipped], default: :initial
  enumerize :time_slot, in: %i[morning afternoon]

  belongs_to :user
  has_many :order_details, dependent: :destroy

  validates :shipping_on, presence: true
  validates :billing_amount, numericality: { only_integer: true, greater_than: 0 }

  class << self
    def bulk_create!
      User.where(suspended: false).each do |user|
        meal_kits = MealKit.default_order.limit(5)
        order_details = meal_kits.map do |meal_kit|
          meal_kit.order_details.build(
            has_frozen: meal_kit.has_frozen,
            price: meal_kit.price
          )
        end
        meal_kits_total_price = meal_kits.sum(&:price)
        frozen_price = meal_kits.select(&:has_frozen).length * 100
        create!(
          user: user,
          shipping_on: Date.current + 3.days,
          time_slot: :morning,
          billing_amount: meal_kits_total_price + frozen_price,
          order_details:
        )
      end
    end
  end
end
