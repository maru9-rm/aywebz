class Admin::AchievementsController < Admin::ApplicationController
    load_and_authorize_resource
    skip_load_and_authorize_resource :only => :create
    before_action :authenticate_user!


    def show
        task = Task.find(params[:task_id])
        #URLのtask_id部分から該当のtaskを探してくる
        user = User.find(params[:user_id])
        #URLのuser_id部分から該当のuserを探してくる
        achievement_status = user.has_achievement?(task)
        #userがtaskのachievementを持っているかを確認する has_achievement?はユーザークラスでメソッドを定義する
        render json: { hasAchievement: achievement_status }
        #jsonでtrueかfalseを返す
    end

    def create
        task = Task.find(params[:task_id])
        user = User.find(params[:user_id])
        task.achievements.create!(user_id: user.id)
        # redirect_to admin_tasks_path
        render json: {status: 'ok'}
    end

    def destroy
        task = Task.find(params[:task_id])
        user = User.find(params[:user_id])
        achievement = task.achievements.find_by!(user_id: user.id)
        achievement.destroy!
        # redirect_to admin_tasks_path
        render json: {status: 'ok'}
    end


end