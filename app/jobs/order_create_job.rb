class OrderCreateJob < ApplicationJob
  queue_as :default

  def perform
    Order.bulk_create!
  end
end
