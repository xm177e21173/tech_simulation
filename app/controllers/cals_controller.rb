class CalsController < ApplicationController
  def new
    @cal = Cal.new
    @cal.user_id = session[:user_id]
    @cal.save
    redirect_to user_path(@cal.user_id), success: 'ユーザー登録しました'
  end
  
  def edit
    set_info
    edu_cost_simulate
    old_cost_simulate
    myhome_cost_simulate
    marriage_cost_simulate
    total_cost_set
    average_cost_set
    @cal.save
    redirect_to cal_path(@cal.user_id)
  end
  
  def show
    set_info
    set_graph_upper
  end
  
  private
  # 教育資金の割り振り
  def edu_cost_simulate
    i = @plan.first_son
    # 末子誕生の20~24年後（大学卒業）
    j = @plan.last_son + 5
    
    # 第一子誕生から末子大学卒業までの年数
    edu_span = j - i + 1
    # 教育費の平均
    s_edu_cost = @cost.edu_cost / edu_span
    
    # 教育費の平均を該当の期間に割振り
    if i <= 1 && 1 <= j
      @cal.g1 = s_edu_cost
    else
      @cal.g1 = 0
    end
    if i <=2  && 2 <= j
      @cal.g2 = s_edu_cost
    else
      @cal.g2 = 0
    end
    if i <= 3 && 3 <= j
      @cal.g3 = s_edu_cost
    else
      @cal.g3 = 0
    end
    if i <= 4 && 4 <= j
      @cal.g4 = s_edu_cost
    else
      @cal.g4 = 0
    end
    if i <= 5 && 5 <= j
      @cal.g5 = s_edu_cost
    else
      @cal.g5 = 0
    end
    if i <= 6 && 6 <= j
      @cal.g6 = s_edu_cost
    else
      @cal.g6 = 0
    end
    if i <= 7 && 7 <= j
      @cal.g7 = s_edu_cost
    else
      @cal.g7 = 0
    end
    if i <= 8 && 8 <= j
      @cal.g8 = s_edu_cost
    else
      @cal.g8 = 0
    end
    if i <= 9 && 9 <= j
      @cal.g9 = s_edu_cost
    else
      @cal.g9 = 0
    end
    if i <= 10 && 10 <= j
      @cal.g10 = s_edu_cost
    else
      @cal.g10 = 0
    end
    
    # 65歳までに末子が大学を卒業しなかった場合の教育費の余りの加算
    if j >= 11
      n = j - 10
      n_edu_cost = s_edu_cost * n
      @cal.g10 += n_edu_cost
    end
  end
  
  # 老後の生活費の割振り
  def old_cost_simulate
    @cal.g10 += @cost.old_cost
  end
  
  # 住宅購入費の割振り
  def myhome_cost_simulate
    i = @plan.when_myhome
    # 住宅購入の35年後
    j = i + 6
    # 住宅購入費の平均値
    s_myhome_cost = @cost.myhome_cost / 7
    
    # 住宅購入費の平均値を該当の期間に割振り
    if i <= 1 && 1 <= j
      @cal.g1 += s_myhome_cost
    end
    if i <= 2 && 2 <= j
      @cal.g2 += s_myhome_cost
    end
    if i <= 3 && 3 <= j
      @cal.g3 += s_myhome_cost
    end
    if i <= 4 && 4 <= j
      @cal.g4 += s_myhome_cost
    end
    if i <= 5 && 5 <= j
      @cal.g5 += s_myhome_cost
    end
    if i <= 6 && 6 <= j
      @cal.g6 += s_myhome_cost
    end
    if i <= 7 && 7 <= j
      @cal.g7 += s_myhome_cost
    end
    if i <= 8 && 8 <= j
      @cal.g8 += s_myhome_cost
    end
    if i <= 9 && 9 <= j
      @cal.g9 += s_myhome_cost
    end
    if i <= 10 && 10 <= j
      @cal.g10 += s_myhome_cost
    end
    
    # ローン返済が65歳までに完了しなかった場合の住宅購入費の余りの加算
    if j >= 11
      n = j - 10
      n_myhome_cost = s_myhome_cost * n
      @cal.g10 += n_myhome_cost
    end
  end
  
  # 結婚費用の割り振り
  def marriage_cost_simulate
    # 該当の期間に結婚費用を割振り
    if @plan.when_marriage == 1
      @cal.g1 += @cost.marriage_cost
    end
    if @plan.when_marriage == 2
      @cal.g2 += @cost.marriage_cost
    end
    if @plan.when_marriage == 3
      @cal.g3 += @cost.marriage_cost
    end
    if @plan.when_marriage == 4
      @cal.g4 += @cost.marriage_cost
    end
    if @plan.when_marriage == 5
      @cal.g5 += @cost.marriage_cost
    end
    if @plan.when_marriage == 6
      @cal.g6 += @cost.marriage_cost
    end
    if @plan.when_marriage == 7
      @cal.g7 += @cost.marriage_cost
    end
    if @plan.when_marriage == 8
      @cal.g8 += @cost.marriage_cost
    end
    if @plan.when_marriage == 9
      @cal.g9 += @cost.marriage_cost
    end
    if @plan.when_marriage == 10
      @cal.g10 += @cost.marriage_cost
    end
  end
  
  # 累積費用を計算
  def total_cost_set
    @cal.t1 = @cal.g1
    @cal.t2 = @cal.t1 + @cal.g2
    @cal.t3 = @cal.t2 + @cal.g3
    @cal.t4 = @cal.t3 + @cal.g4
    @cal.t5 = @cal.t4 + @cal.g5
    @cal.t6 = @cal.t5 + @cal.g6
    @cal.t7 = @cal.t6 + @cal.g7
    @cal.t8 = @cal.t7 + @cal.g8
    @cal.t9 = @cal.t8 + @cal.g9
    # 退職金を減算
    @cal.t10 = @cal.t9 + @cal.g10 - @plan.severance
  end
  
  # 資産形成の目標ペースの計算
  def average_cost_set
    to_save = @cost.target - @plan.saving - @plan.severance
    single_to_save = to_save / 9
    @cal.a1 = @plan.saving
    @cal.a2 = @cal.a1 + single_to_save
    @cal.a3 = @cal.a2 + single_to_save
    @cal.a4 = @cal.a3 + single_to_save
    @cal.a5 = @cal.a4 + single_to_save
    @cal.a6 = @cal.a5 + single_to_save
    @cal.a7 = @cal.a6 + single_to_save
    @cal.a8 = @cal.a7 + single_to_save
    @cal.a9 = @cal.a8 + single_to_save
    @cal.a10 = @cal.a9 + single_to_save
  end
  
  # グラフ左側Y軸の上限値の設定
  def set_graph_upper
    @to_save_target = @cost.target - @plan.severance
    @graph_upper_1 = @to_save_target / 1000
    @graph_upper = @graph_upper_1 + 1
  end
end
