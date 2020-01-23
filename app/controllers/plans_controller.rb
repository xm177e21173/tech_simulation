class PlansController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @plan = Plan.new(
      marriage: "わからない",
      sons: 0,
      birth: 1990,
      user_id: session[:user_id],
      retirement: 0,
      severance: 0,
      when_marriage: 18,
      wedding: "わからない",
      first_son: 18,
      last_son: 18,
      myhome: "わからない",
      when_myhome: 18,
      )
    @plan.save
    redirect_to new_cost_path
  end
    
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_edit_params)
       @plan.retirement = params[:birth] + 65
       @plan.save
       redirect_to user_path(session[:user_id]), success: '人生設計を編集しました'
    else
      flash.now[:danger] = '人生設計を編集できませんでした'
      render :edit
    end
  end
  
  private
  def plan_new_params
    params.require(:plan).permit(:marriage, :sons, :birth)
  end
  
  def plan_edit_params
    params.require(:plan).permit(:marriage, :sons)
  end
end
