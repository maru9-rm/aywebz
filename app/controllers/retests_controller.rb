class RetestsController < ApplicationController
    def show
        @tasks = Task.where(grade: current_user.profile.grade)
    end
end