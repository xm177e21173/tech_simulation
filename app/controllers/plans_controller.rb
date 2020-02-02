class PlansController < ApplicationController
  def new
    set_plan
    @plan.save
    redirect_to new_cost_path
  end
    
  def edit
    set_info
  end
  
  def update
    set_info
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
  
  # 初期値の設定
  def set_plan
    @plan = Plan.new(
      user_id:       session[:user_id],
      marriage:     "99",
      when_marriage: 99,
      wedding:      "99",
      sons:          99,
      first_son:     99,
      last_son:      99,
      myhome:       "99",
      when_myhome:   99,
      birth:         99,
      retirement:    99,
      saving:         0,
      severance:      0,
      )
  end
end
