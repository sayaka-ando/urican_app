class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :goal_set

  def show
    
    @goal = current_user.performance
    @plans = current_user.plans
    
    @my_price = Plan.where(user: current_user.id, sales_status_id: 3)
    @my_price_sum = @my_price.sum(:price)

    @performance = Performance.find(params[:id])

  end

  private
  def goal_set
    if current_user.performance.blank?
      redirect_to new_performance_path
    end
  end

end
