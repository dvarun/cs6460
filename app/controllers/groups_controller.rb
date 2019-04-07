class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show]

  def show
    if @group.group_members.where("user_id = ?", current_user.id).present? || current_user.is_instructor?
      ahoy.track "Visited group", {group: @group}
      @group_members = @group.group_members
      @state_chart = State.all.joins(:tasks).group(:name).where("tasks.group_id = ?", @group.id).count
    else
      redirect_to @group.course, notice: "Please join or create a group"
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      ahoy.track "Created a group", {group: @group}
      GroupMember.create(user_id: current_user.id, group_id: @group.id)
      redirect_to @group.course, notice: "Group was successfully created."
    else
      redirect_to courses_path, notice: "Group was not created. please contact admin"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :course_id, :instructor_allowed)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
