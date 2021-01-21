class UsersController < ApplicationController

  def show
    
    @goal = current_user.performance
    @plans = current_user.plans
    
    @my_price = Plan.where(user: current_user.id, sales_status_id: 3)
    @my_price_sum = @my_price.sum(:price)

  end

end
