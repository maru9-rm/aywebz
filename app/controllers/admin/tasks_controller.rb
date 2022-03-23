class Admin::TasksController < Admin::ApplicationController
    load_and_authorize_resource

    def index
        @first_grade_tasks = Task.where(grade: 3)
        @second_grade_tasks = Task.where(grade: 4)
        @third_grade_tasks = Task.where(grade: 5)
        users = User.eager_load(:profile)
        @first_grade_users = users.where(profiles: {grade: 3})
        @second_grade_users = users.where(profiles: {grade: 4})
        @third_grade_users = users.where(profiles: {grade: 5})

    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
          redirect_to admin_tasks_path, notice: 'Saved in successfully.'
        # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
        else
          flash.now[:error] = 'Failed to save. Please check the error message.'
          render :new
          # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
        end
    end


    def edit
      @task =Task.find(params[:id])
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to admin_tasks_path, notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  
    def destroy
      task = Task.find(params[:id])
      # @はつける必要ない。なぜならビューで使うわけじゃないから。
      task.destroy!
      # データを渡すわけじゃないので失敗するわけない、失敗したときはアプリがおかしいので例外が発生するように！をつける
      redirect_to admin_tasks_path, notice: '削除に成功しました'
    end
  





    private

    def task_params
      params.require(:task).permit(:grade, :testday, :subject, :title, :source, :detail, :criterion).merge(user_id: current_user.id)
    end

end