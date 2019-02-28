class ProjectMembersController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @project = Project.find(params[:project_id])
    @team.project = @project
  end

  private

  def team_params
    params.require(:team).permit(:user)
  end
end
