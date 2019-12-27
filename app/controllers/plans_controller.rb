class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = session[:user_id]
    
    if @plan.save
      redirect_to user_path(@plan.user_id), success: '人生設計を登録しました'
    else
      flash.now[:danger] = '人生設計の登録に失敗しました'
      render :new
    end
    
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
      
    if @plan.update(plan_params)
      redirect_to user_path(session[:user_id]), success: '人生設計を編集しました'
    else
      flash.now[:danger] = '人生設計を編集できませんでした'
      render :edit
    end
  end
  
  private
  def plan_params
    params.require(:plan).permit(:marriage, :sons, :birth)
  end
  
end
