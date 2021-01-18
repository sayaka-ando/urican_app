class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_plan, only: [:show]
  before_action :login_state, only: [:edit, :destroy]

  def index
    @plans = Plan.includes(:user).order("created_at DESC")
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

  def show
  end
  
  private

  def plan_params
    params.require(:plan).permit(:title, :client, :price, :client_status_id, :sales_status_id, :memo, :knowledge).merge(user_id: current_user.id)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

end
