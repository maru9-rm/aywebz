class Admin::AchievementsController < Admin::ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!


    def show
    end

    def create
        task.achievements.create!(user_id: user.id)     
    end

    def destroy
    end


end