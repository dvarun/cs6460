class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "course"

  def index
    @course = Course.all
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

  def set_course
    @course = Course.find(params[:id])
  end
end
