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
      when_marriage: 0,
      wedding: "わからない",
      first_son: 0,
      last_son: 0,
      myhome: "5",
      when_myhome: 18,
      )
    @plan.save
    redirect_to new_cost_path
  end
    
  def edit
    @plan = Plan.find_by(user_id: session[:user_id])
  end
  
  def update
    @plan = Plan.find_by(user_id: session[:user_id])
    if @plan.update(plan_params)
       @plan.retirement = @plan.birth + 65
       @plan.save
       redirect_to user_path(session[:user_id]), success: '人生設計を編集しました'
    else
      flash.now[:danger] = '人生設計を編集できませんでした'
      render :edit
    end
  end
  
  private
  def plan_params
    params.require(:plan).permit(
      :birth,
      :marriage,
      :sons,
      :when_marriage,
      :wedding,
      :sons,
      :first_son,
      :last_son,
      :myhome,
      :when_myhome,
      :saving,
      :severance)
  end
end
