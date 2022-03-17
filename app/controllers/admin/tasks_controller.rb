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

    private

    def task_params
      params.require(:task).permit(:grade, :testday, :subject, :title, :source, :detail, :criterion).merge(user_id: current_user.id)
    end

end