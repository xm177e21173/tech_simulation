class CostsController < ApplicationController
  def new
    @cost = Cost.new
    @cost.user_id = session[:user_id]
    @cost.save
    redirect_to user_path(@cost.user_id), success: 'ユーザー登録しました'
  end
  
  def edit
    @cost = Cost.find(params[:id])
    @plan = Plan.find_by(user_id:params[:id])
  end
  
  def update
    @cost = Cost.find(params[:id])
    if @cost.update(cost_params)
       @cost.target = @cost.edu_cost + @cost.old_cost + @cost.others
       @cost.save
       redirect_to user_path(session[:user_id]), success: 'シミュレーションを更新しました'
    else
      flash.now[:danger] = '費用についての情報を編集できませんでした'
      render :edit
    end
  end
  
  private
  def cost_params
    params.require(:cost).permit(:edu_cost, :old_cost, :others, :target)
  end
end
