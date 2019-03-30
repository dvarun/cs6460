class AssignmentDiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show]

  def show
    if @group.group_members.where("user_id = ?", current_user.id).present?
      @assignment = @group.course.assignment
      ahoy.track "Visited the assignment discussion page", assignment: @assignment
      @discussion = Discussion.new
      @comments = Discussion.where("group_id = ?", @group.id)
      if @assignment.blank?
        redirect_to @group.course, notice: "No assignment available yet"
      end
    else
      redirect_to courses_path, notice: "Content not available"
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
