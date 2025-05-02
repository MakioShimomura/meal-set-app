class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enumerize :shipping_schedule, in: %i[weekly twice_month]

  belongs_to :plan, optional: true

  with_options if: :plan_id? do
    validates :name, presence: true
    validates :address, presence: true
    validates :tel, presence: true
    validates :shipping_schedule, presence: true
  end
end
