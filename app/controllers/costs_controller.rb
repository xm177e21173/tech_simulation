class CostsController < ApplicationController
  def new
    @cost = Cost.new(
      user_id: session[:user_id],
      edu_cost: 0,
      old_cost: 0,
      target: 0,
      others: 0,
      marriage_cost: 0,
      myhome_cost: 0
      )
    @cost.save
    redirect_to new_cal_path
  end
  
  def edit
    set_info
  end
  
  def update
    @cost = Cost.find(params[:id])
    if @cost.update(cost_params)
       @cost.target = @cost.edu_cost + @cost.old_cost + @cost.others + @cost.myhome_cost + @cost.marriage_cost
       @cost.save
       redirect_to user_path(session[:user_id]), success: 'シミュレーションを更新しました'
    else
      flash.now[:danger] = '費用についての情報を編集できませんでした'
      render :edit
    end
  end
  
  private
  def cost_params
    params.require(:cost).permit(
      :edu_cost,
      :old_cost,
      :others,
      :marriage_cost,
      :myhome_cost
      )
  end
end
