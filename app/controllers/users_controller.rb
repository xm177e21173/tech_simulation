class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    set_info
    
    if @cost.target
      @today = Date.today
      @worktime = @plan.retirement - @today.year
      @to_earn = @cost.target - @plan.saving - @plan.severance
      @per_year = @to_earn / @worktime
      @per_month = @per_year / 12
    end
    
    when_marriage_setter
    when_first_son_setter
    when_last_son_setter
    when_myhome_setter
    
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
  
  def when_marriage_setter
    if @plan.when_marriage == 1
      @when_marriage = "20代前半で"
    elsif @plan.when_marriage == 2
      @when_marriage = "20代後半で"
    elsif @plan.when_marriage == 3
      @when_marriage = "30代前半で"
    elsif @plan.when_marriage == 4
      @when_marriage = "30代後半で"
    elsif @plan.when_marriage == 5
      @when_marriage = "40代前半で"
    elsif @plan.when_marriage == 6
      @when_marriage = "40代後半で"
    elsif @plan.when_marriage == 7
      @when_marriage = "50代前半で"
    elsif @plan.when_marriage == 8
      @when_marriage = "50代後半で"
    elsif @plan.when_marriage == 9
      @when_marriage = "60代前半で"
    elsif @plan.when_marriage == 10
      @when_marriage = "65歳以降に"
    end
  end
  
  def when_first_son_setter
    if @plan.first_son == 1
      @when_first_son = "20代前半"
    elsif @plan.first_son == 2
      @when_first_son = "20代後半"
    elsif @plan.first_son == 3
      @when_first_son = "30代前半"
    elsif @plan.first_son == 4
      @when_first_son = "30代後半"
    elsif @plan.first_son == 5
      @when_first_son = "40代前半"
    elsif @plan.first_son == 6
      @when_first_son = "340代後半"
    elsif @plan.first_son == 7
      @when_first_son = "50代前半"
    elsif @plan.first_son == 8
      @when_first_son = "50代後半"
    elsif @plan.first_son == 9
      @when_first_son = "60代前半"
    elsif @plan.first_son == 10
      @when_first_son = "65歳以降"
    end
  end
  
  def when_last_son_setter
    if @plan.last_son == 1
      @when_last_son = "20代前半"
    elsif @plan.last_son == 2
      @when_last_son = "20代後半"
    elsif @plan.last_son == 3
      @when_last_son = "30代前半"
    elsif @plan.last_son == 4
      @when_last_son = "30代後半"
    elsif @plan.last_son == 5
      @when_last_son = "40代前半"
    elsif @plan.last_son == 6
      @when_last_son = "40代後半"
    elsif @plan.last_son == 7
      @when_last_son = "50代前半"
    elsif @plan.last_son == 8
      @when_last_son = "50代後半"
    elsif @plan.last_son == 9
      @when_last_son = "60代前半"
    elsif @plan.last_son == 10
      @when_last_son = "65歳以降"
    end
  end
  
  def when_myhome_setter
    if @plan.when_myhome == 1
      @when_myhome = "20代前半"
    elsif @plan.when_myhome == 2
      @when_myhome = "20代後半"
    elsif @plan.when_myhome == 3
      @when_myhome = "30代前半"
    elsif @plan.when_myhome == 4
      @when_myhome = "30代後半"
    elsif @plan.when_myhome == 5
      @when_myhome = "40代前半"
    elsif @plan.when_myhome == 6
      @when_myhome = "40代後半"
    elsif @plan.when_myhome == 7
      @when_myhome = "50代前半"
    elsif @plan.when_myhome == 8
      @when_myhome = "50代後半"
    elsif @plan.when_myhome == 9
      @when_myhome = "60代前半"
    elsif @plan.when_myhome == 10
      @when_myhome = "65歳以降"
    end
  end
  
end
