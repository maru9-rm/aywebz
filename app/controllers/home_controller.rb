class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @notifications = Notification.all.order(id: :DESC)
    end
end
