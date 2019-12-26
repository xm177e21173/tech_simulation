class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(
      marriage: params[:marriage],
      sons:     params[:sons],
      birth:    params[:birth]
      )
    @plan.user_id = session[:user_id]
    
    if @plan.save
      redirect_to user_path(@plan.user_id), success: '人生設計を登録しました'
    else
      flash.now[:danger] = '人生設計の登録に失敗しました'
      render :new
    end
    
  end
  
  
end
