class PlansController < ApplicationController

  def index
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def plan_params
    params.require(:plan).permit(:title, :client, :price, :client_status_id, :sales_status_id, :memo, :knowledge).merge(user_id: current_user.id)
  end

end
