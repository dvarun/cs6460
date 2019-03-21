class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.is_instructor
      @users = User.all
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def list_group
    if current_user.is_instructor
      @groups = Group.where("instructor_allowed = true")
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end
end
