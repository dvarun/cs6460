class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.all
  end

  def show
    @groups = Group.where("course_id=?", @course.id)
    @group = Group.new
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
