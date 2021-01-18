class PlansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to root_path
  end

  
  private

  def plan_params
    params.require(:plan).permit(:title, :client, :price, :client_status_id, :sales_status_id, :memo, :knowledge).merge(user_id: current_user.id)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def login_state
    unless current_user.id == @plan.user_id
      redirect_to action: :index
    end
  end

end
