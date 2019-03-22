class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "course"

  def index
    @course = Course.all
  end

  def new
    if current_user.is_instructor
      @course = Course.new
      @courses = Course.all
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "Course added successfully"
    else
      redirect_to courses_path, notice: "Course could not be added"
    end
  end

  def destroy
    @course.destroy
    redirect_to new_course_path, notice: "Course was destroyed"
  end

  def show
    group = current_user.groups.where("course_id=?", @course.id).present?
    if group
      group_id = current_user.groups.find_by_course_id(@course.id)
      redirect_to group_id
    else
      @groups = Group.where("course_id=?", @course.id)
      @group = Group.new
      @group_members = GroupMember.new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
