class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(session[:user_id])
    @plan = Plan.find_by(user_id: session[:user_id])
    @cost = Cost.find_by(user_id: session[:user_id])
    
    if @cost.target
      @today = Date.today
      @worktime = @plan.retirement - @today.year
      @per_year = @cost.target / @worktime
      @per_month = @per_year / 12
    end
    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to new_plan_path, success: "新規登録しました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params) 
      redirect_to user_path, success: "ユーザー情報を編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_name_email_params
    params.requiure(:user).permit(:name, :email)
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
end
