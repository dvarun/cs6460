class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def new
    begin
      if params[:group_id].present?
        group_id = params[:group_id]
        @group = Group.find(group_id)
        if @group.group_members.where("user_id = ?", current_user.id).present?
          @submission = Submission.new
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

  def create
    @submission = Submission.create! params.require(:submission).permit(:course_id, :group_id, :detail, :user_id)
    @submission.project.attach(params[:submission][:project])
    redirect_to @submission
  end

  def show
    @submission = Submission.find(params[:id])
  end
end
