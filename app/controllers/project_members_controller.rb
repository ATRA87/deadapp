class ProjectMembersController < ApplicationController
  def new
    @project_member = ProjectMember.new
  end

  def create
    @project_member = ProjectMember.new(project_member_params)
    @project = Project.find(params[:project_id])
    @project_member.project = @project
  end

  def index
    @invitations = policy_scope(ProjectMember).where(user: current_user).where(state: 'pending')
  end

  def update
    @invitation = ProjectMember.find(params[:id])
    authorize @invitation
    @invitation.state = "accepted"
    return redirect_to project_members_path if @invitation.save
  end

  def destroy
    @invitation = ProjectMember.find(params[:id])
    authorize @invitation
    return redirect_to project_members_path if @invitation.destroy

  end

  private

  def project_member_params
    params.require(:project_member).permit(:user)
  end
end