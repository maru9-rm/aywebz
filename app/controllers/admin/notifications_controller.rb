class Admin::NotificationsController < Admin::ApplicationController
    load_and_authorize_resource
    
    def index
        @notifications = Notification.all.order(id: :DESC)
    end


    def new
        @notification = current_user.notifications.build
    end

    def create
        @notification = current_user.notifications.build(notification_params)
        if @notification.save
          redirect_to admin_notifications_path, notice: 'お知らせを作成しました。'
        # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
        else
          flash.now[:error] = 'お知らせの作成に失敗しました。'
          render :new
          # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
        end
    end

    def edit
      @notification = Notification.find(params[:id])
    end
  
    def update
      @notification = Notification.find(params[:id])
      if @notification.update(notification_params)
        redirect_to root_path, notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  
    

    def destroy
      notification = Notification.find(params[:id])
      notification.destroy!
      redirect_to root_path, notice: '削除に成功しました'

    end 


    private

    def notification_params
      params.require(:notification).permit(:title, :content).merge(user_id: current_user.id)
    end

end