class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show]

  def index
    if params[:group_id].present?
      group_id = params[:group_id]
      @group = Group.find(group_id)
      if @group.present?
        @completed_task = @group.tasks.where("state_id = 3")
      else
        redirect_to courses_path, notice: "Please join or create a group"
      end
    else
      redirect_to courses_path, notice: "Please join or create a group"
    end
  end

  def show
    @group = @task.group
    if @task.group.group_members.where("user_id = ?", current_user.id).present?
      @feedback = Feedback.new
      @feedbacks = Feedback.where("group_id = ?", @task.group.id)
    else
      redirect_to @task.group, notice: "Content not available"
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
