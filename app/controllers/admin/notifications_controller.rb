class Admin::NotificationsController < Admin::ApplicationController
    load_and_authorize_resource
    
    def index
        @notifications = Notification.all
    end


    def new
        @notification = current_user.notifications.build
    end

    def create
        @notification = current_user.notifications.build(notification_params)
        if @notification.save
          redirect_to admin_notifications_path, notice: '保存完了しました'
        # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
          # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
        end
    end
    

    private

    def notification_params
      params.require(:notification).permit(:title, :content).merge(user_id: current_user.id)
    end

end