class TasksController < ApplicationController
  before_action :set_group, only: [:show]

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.group_id), notice: "Task was successfully created."
    else
      redirect_to courses_path, notice: "Task was not created. please contact admin"
    end
  end

  def show
    @todo_task = Task.where("group_id = ? and state_id = ?", @group.id, 1)
    @in_progress_task = Task.where("group_id = ? and state_id = ?", @group.id, 2)
    @done_task = Task.where("group_id = ? and state_id = ?", @group.id, 3)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :detail, :creator_id, :state_id, :group_id)
  end
end
