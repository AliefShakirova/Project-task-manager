class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task created" }
        format.js
      end
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task updated"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task destroyed"
  end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_task
  @task = Task.find(params[:id])
end

# Only allow a list of trusted parameters through.
def task_params
  params.require(:task).permit(:title, :description, :status)
end
