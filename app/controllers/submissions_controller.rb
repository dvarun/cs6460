class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
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
