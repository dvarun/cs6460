class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show]

  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        ahoy.track "Gave feedback", {feedback: @feedback}
        format.html { redirect_to feedback_path(@feedback.task.id), notice: "feedback was successfully added." }
      else
        format.html { redirect_to feedback_path(@feedback.task.id), alert: "feedback was not added. please add some details" }
      end
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    ahoy.track "Deleted feedback", {feedback: @feedback}
    respond_to do |format|
      format.html { redirect_to feedback_path(@feedback.task.id), notice: "Feedback was successfully destroyed." }
    end
  end

  def index
    begin
      if params[:group_id].present?
        group_id = params[:group_id]
        @group = Group.find(group_id)
        if @group.present? && @group.group_members.where("user_id = ?", current_user.id).present? || current_user.is_instructor?
          @completed_task = @group.tasks.where("state_id = 3")
          ahoy.track "Visited feedback items page"
        else
          redirect_to courses_path, notice: "Please join or create a group"
        end
      else
        redirect_to courses_path, notice: "Please join or create a group"
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to courses_path, notice: "Please join or create a group"
    end
  end

  def show
    @group = @task.group
    if @task.group.group_members.where("user_id = ?", current_user.id).present? || current_user.is_instructor?
      @feedback = Feedback.new
      @feedbacks = Feedback.where("task_id = ?", @task.id)
      ahoy.track "Visited a feedback page", item: @task
    else
      redirect_to @task.group, notice: "Content not available"
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:user_id, :task_id, :detail)
  end
end
