class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show]

  def index
    if current_user.is_instructor
      @users = User.where("is_instructor = false")
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def list_groups
    if current_user.is_instructor
      @groups = Group.where("instructor_allowed = true")
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def show
    if current_user.is_instructor
      @task = Task.where("assigned_id = ?", @student.id)
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  private

  def set_student
    @student = User.find(params[:id])
  end
end