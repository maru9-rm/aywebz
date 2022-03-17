class Admin::AchievementsController < Admin::ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!


    def show
    end

    def create
        task = Task.find(params[:task_id])
        user = User.find(params[:user_id])
        task.achievements.create!(user_id: user.id)
        redirect_to admin_tasks_path
    end

    def destroy
        task = Task.find(params[:task_id])
        user = User.find(params[:user_id])
        achievement = task.achievements.find_by!(user_id: user.id)
        achievement.destroy!
        redirect_to admin_tasks_path
    end


end