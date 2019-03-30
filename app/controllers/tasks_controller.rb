class TasksController < ApplicationController
  before_action :set_group, only: [:show]
  before_action :authenticate_user!

  def create
    @task = Task.new(task_params)
    if @task.save
      ahoy.track "Created Task", {task: @task}
      redirect_to task_path(@task.group_id), notice: "Task was successfully created."
    else
      redirect_to courses_path, alert: "Task was not created. please add details"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @group = Group.find(@task.group_id)
    if @group.group_members.where("user_id = ?", current_user.id).blank?
      redirect_to @group.course, notice: "Please join or create a group"
    else
      users = [] #declare empty array to store existing user
      for user in @group.group_members
        users << user.user_id
      end
      @list_of_user = User.where("id in (?)", users)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      ahoy.track "Updated Task", {task: @task}
      redirect_to task_path(@task.group_id), notice: "Task was successfully updated."
    else
      redirect_to courses_path, notice: "Task was not updated. please contact admin"
    end
  end

  def show
    if @group.group_members.where("user_id = ?", current_user.id).blank?
      redirect_to @group.course, notice: "Please join or create a group"
    else
      @todo_task = Task.where("group_id = ? and state_id = ?", @group.id, 1)
      @in_progress_task = Task.where("group_id = ? and state_id = ?", @group.id, 2)
      @done_task = Task.where("group_id = ? and state_id = ?", @group.id, 3)
      @total_task = Task.where("group_id = ?", @group.id)
      ahoy.track "Viewed tasks"

      if @total_task.blank?
        @progress_percent = 0
      else
        @progress_percent = (1 - ((@in_progress_task.count.to_f + @todo_task.count.to_f) / @total_task.count.to_f)) * 100
      end
      users = [] #declare empty array to store existing user
      for user in @group.group_members
        users << user.user_id
      end
      @list_of_user = User.where("id in (?)", users)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    ahoy.track("Deleted task", {task: @task})
    respond_to do |format|
      format.html { redirect_to task_path(@task.group_id), notice: "Task was successfully destroyed." }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :detail, :creator_id, :state_id, :group_id, :assigned_id)
  end
end
