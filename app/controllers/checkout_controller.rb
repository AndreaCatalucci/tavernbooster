class CheckoutController < ApplicationController
  def index
    @paid_orders = Order.paid.all
    @paid_price_sum = Order.unpaid.all.inject(0) {|acc, o| acc += o.total_price}
    @paid_people_sum = Order.paid.sum(:people)
    @unpaid_orders = Order.unpaid.all
    @unpaid_price_sum = Order.unpaid.all.inject(0) {|acc, o| acc += o.total_price}
    @unpaid_people_sum = Order.unpaid.sum(:people)
  end

end
