class GroupMembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @group_member = GroupMember.new(group_member_params)
    if @group_member.save
      group = Group.find(@group_member.group_id)
      redirect_to group.course, notice: "Joined Group Successfully"
    else
      render :new, notice: "Group was not created."
    end
  end

  private

  def group_member_params
    params.require(:group_member).permit(:group_id, :user_id)
  end
end
