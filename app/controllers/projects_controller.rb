class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :primary_photo]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @project = Project.new
    @users = User.all
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user
    ids = params[:project][:user_ids].uniq
    ids.delete(current_user.id.to_s)

    ids.each do |member_id|
      next if member_id == ""

      user = User.find(member_id)
      ProjectMember.create(project: @project, user: user) if user
    end

    photo = params[:project][:project_asset][:photo]
    ProjectAsset.create(project: @project, photo: photo)

    return redirect_to @project if @project.save

    render :new
  end

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def show
    authorize @project
  end

  def edit
    @users = User.all
    authorize @project
  end

  def update
    authorize @project
    @project.update(project_params)
    ids = params[:project][:user_ids].uniq
    ids.delete(current_user.id.to_s)

    ids.each do |member_id|
      next if member_id == ""

      user = User.find(member_id)
      ProjectMember.create(project: @project, user: user) if user
    end

    photo = params[:project][:project_asset][:photo]
    ProjectAsset.create(project: @project, photo: photo)

    return redirect_to @project if @project.save

    render :new
  end

  def project_assets
    @project.project_assets.order_by(priority: :desc)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :category, :user_ids)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

