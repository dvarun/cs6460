class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @course = Course.all
  end

  def show
    @groups = Group.where("course_id=?", @course.id)
    @group = Group.new
    @group_members = GroupMember.new
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
