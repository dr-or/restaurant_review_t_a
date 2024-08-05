class Restaurant::WithTipsCountQuery < ApplicationQuery
  def resolve(tips)
    key = tips.keys.first
    operator = Restaurant::OPERATORS[key.to_sym]

    restaurant_ids = Order.select(:restaurant_id)
                          .left_joins(:tips)
                          .group(:restaurant_id)
                          .having("COUNT(tips.id) #{operator} ?", tips[key])

    Restaurant.where(id: restaurant_ids)
  end
end
