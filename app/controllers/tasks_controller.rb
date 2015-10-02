class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:name))
    @task.save
    redirect_to tasks_path
  end

  def update
    task = Task.find(params[:id])

    is_completed = false
    if params[:is_completed]
      is_completed = true
    end

    task.is_completed = is_completed
    task.save
    redirect_to tasks_path
  end


end
