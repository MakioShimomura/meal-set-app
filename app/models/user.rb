class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :plan, optional: true

  with_options if: :plan_id? do
    validates :name, presence: true
    validates :address, presence: true
    validates :tel, presence: true
  end
end
