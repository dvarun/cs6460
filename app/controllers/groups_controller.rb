class GroupsController < ApplicationController
  #before_action :authenticate_user!

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group.course, notice: "Group was successfully created."
    else
      render :new, notice: "Group was not created."
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :course_id, :instructor_allowed)
  end
end
