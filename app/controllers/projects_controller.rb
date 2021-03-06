class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :primary_photo]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

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

  def search
    @projects = policy_scope(Project).search_by_name_and_description(params[:search])
    authorize @projects
  end

  def show
    @chat_users = @project.chat_users

    @users = User.all
    authorize @project
    # get all the orders from the user that havent been reviewed yet
    # TODO: get only those orders that have been delivered
    @orders_by_user = []
    if current_user
      @orders_by_user = current_user.orders.select do |order|
        order.project == @project && !order.reviewed?
      end
    end
  end

  def edit
    @users = User.all
    authorize @project
  end

  def update
    @users = User.all
    authorize @project
    @project.update(project_params)
    @current_team = @project.project_members
    ids = params[:project][:user_ids].uniq
    ids.delete(current_user.id.to_s)
    @current_team.each do |member_invitation|
      member_invitation.destroy unless ids.include?(member_invitation.id)
    end
    ids.each do |member_id|
      next if member_id == ""

      next if @project.users.map { |user| user.id.to_s }.include?(member_id)

      user = User.find(member_id)
      ProjectMember.create(project: @project, user: user) if user
    end

    photo = params[:project][:project_asset][:photo]
    ProjectAsset.create(project: @project, photo: photo)

    if @project.save
      redirect_to @project
    else
      render :edit
    end
  end

  def project_assets
    @project.project_assets.order_by(priority: :desc)
  end

  def mine
    @projects = policy_scope(Project).where(user: current_user)
    render :index
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :category, :user_ids, :color_scheme, :font, :button_shape, :social_log_in)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
