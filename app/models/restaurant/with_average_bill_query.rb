class Restaurant::WithAverageBillQuery < ApplicationQuery
  OPERATORS = {
    more: '>',
    less: '<',
    eq: '='
  }.freeze

  def resolve(param)
    key = param.keys.first
    operator = OPERATORS[key.to_sym]

    restaurant_ids = Order.select(:restaurant_id)
                          .group(:restaurant_id)
                          .having("AVG(orders.price) #{operator} ?", param[key])

    Restaurant.where(id: restaurant_ids)
  end
end
