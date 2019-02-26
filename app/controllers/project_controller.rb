class ProjectController < ApplicationController
  def index
    @projects = Project.all
  end
end
