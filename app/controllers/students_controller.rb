class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show]

  def index
    if current_user.is_instructor
      @users = User.where("is_instructor = false")
      @chart = Ahoy::Event.where(:user_id => @users.ids).group(:name).count
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def list_groups
    if current_user.is_instructor
      @groups = Group.where("instructor_allowed = true")
      @group_chart = Course.joins(:groups).group(:name).where("instructor_allowed = true").count
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  def group_insight
    if current_user.is_instructor
      @group = Group.find(params[:id])
      @state_chart = State.all.joins(:tasks).group(:name).where("tasks.group_id = ?", @group.id).count
      users = [] #declare empty array to store existing user
      for user in @group.group_members
        users << user.user_id
      end
      @member_activity = Ahoy::Event.where("user_id in (?)", users).group(:name).count
      @sentiment = Tone.where("user_id in (?)", users).joins(:tone_scores).group(:name).count
    else
      redirect_to students_path, notice: "Page not available"
    end
  end

  def show
    if current_user.is_instructor
      @task = Task.where("assigned_id = ?", @student.id)
      @activity = Ahoy::Event.where("user_id = ?", @student.id).count
      @event_chart = Ahoy::Event.where("user_id = ?", @student.id).group(:name).count
      @tone_chart = @student.tones.joins(:tone_scores).group(:name).count
    else
      redirect_to courses_path, notice: "Page not available"
    end
  end

  private

  def set_student
    @student = User.find(params[:id])
  end
end
