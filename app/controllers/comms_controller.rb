class CommsController < ApplicationController
    def show
        @notifications = Notification.all.order(id: :DESC)
    end
end