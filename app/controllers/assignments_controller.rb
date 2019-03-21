class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.is_instructor
      @assignment = Assignment.new
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def create
    @assignment = Assignment.create! params.require(:assignment).permit(:course_id, :title, :detail)
    @assignment.document.attach(params[:assignment][:document])
    redirect_to @assignment
  end

  def show
    @assignment = Assignment.find(params[:id])
  end
end
