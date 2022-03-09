class CommsController < ApplicationController
    def show
        @notifications = Notification.all
    end
end