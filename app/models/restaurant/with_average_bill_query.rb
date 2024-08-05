class Restaurant::WithAverageBillQuery < ApplicationQuery
  OPERATORS = {
    more: '>',
    less: '<',
    eq: '='
  }.freeze

  def resolve(avg_bill)
    key = avg_bill.keys.first
    operator = OPERATORS[key.to_sym]

    restaurant_ids = Order.select(:restaurant_id)
                          .group(:restaurant_id)
                          .having("AVG(orders.price) #{operator} ?", avg_bill[key])

    Restaurant.where(id: restaurant_ids)
  end
end
