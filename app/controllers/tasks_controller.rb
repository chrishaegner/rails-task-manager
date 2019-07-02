class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
    Task.create(restaurant_params)
    redirect_to tasks_path
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    @task.update(restaurant_params)
    redirect_to tasks_path
  end
  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  private

  def restaurant_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
