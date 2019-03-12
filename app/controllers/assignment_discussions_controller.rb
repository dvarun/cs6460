class AssignmentDiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show]

  def show
    if @group.group_members.where("user_id = ?", current_user.id).present?
      @assignment = @group.course.assignment
      if @assignment.blank?
        redirect_to @group.course, notice: "No assignment available yet"
      end
    else
      redirect_to @group.course, notice: "Content not available"
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
