class TasksController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(restaurant_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(restaurant_params)
    redirect_to tasks_path
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  private

  def restaurant_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_restaurant
    @task = Task.find(params[:id])
  end
end
