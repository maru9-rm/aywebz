class TasksController < Admin::ApplicationController
    load_and_authorize_resource

    def index
        @tasks = Task.all
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
          redirect_to tasks_path, notice: 'Saved in successfully.'
        # notice: でフラッシュメッセージにテキスト(ハッシュ)を持たせてリクエストを送ることができる。
        else
          flash.now[:error] = 'Failed to save. Please check the error message.'
          render :new
          # この場合はレンダーなので、URLにリクエストを送るわけではないため、その場ですぐフラッシュを表示させるためにflash.nowで！
        end
    end

    private

    def task_params
      params.require(:task).permit(:grade, :testday, :subject, :title, :source, :detail, :criterion).merge(user_id: current_user.id)
    end

end