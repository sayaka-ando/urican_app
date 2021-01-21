class UsersController < ApplicationController

  def show
    
    @goal = current_user.performance
    @plans = current_user.plans
    
    @my_price = Plan.where(user: current_user.id, sales_status_id: 3)
    @my_price_sum = @my_price.sum(:price)

  end

  # params.require(:user).permit(user_id: current_user.id).merge(plan_id: palams[:plan_id], performance_id: params[:performance_id])

end
