class PerformancesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_performance, only: [:edit, :update, :destroy]
  before_action :login_state, only: [:edit, :destroy]


  def index
    @goal = Performance.where(user: current_user.id)
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @performance.update(performance_params)
      redirect_to performance_path
    else
      render :edit
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:goal).merge(user_id: current_user.id)
  end

  def set_plan
    @performance = Performance.find(params[:id])
  end

  def login_state
    unless current_user.id == @performance.user_id
      redirect_to root_path
    end
  end

end
