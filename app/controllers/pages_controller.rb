class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :profile]
  def home
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def profile
    @user = User.find(params[:id])
    @projects = @user.projects
    @side_projects = @user.side_projects
  end
end
