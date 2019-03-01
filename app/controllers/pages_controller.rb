class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @projects = current_user.projects
    @side_projects = current_user.side_projects
  end
end
