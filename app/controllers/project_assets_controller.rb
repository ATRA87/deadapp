class ProjectAssetsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index]

  def new
    @project_asset = ProjectAsset.new
    @project_asset.project = @project
    authorize @project_asset
  end

  def create
    @project_asset = ProjectAsset.new(project_asset_params)
    @project_asset.project = @project
    authorize @project_asset
    return redirect_to @project if @project_asset.save

    render :new
  end

  def destroy
    @project_asset = ProjectAsset.find(params[:project_id])
    @project_asset.destroy
  end

  private

  def project_asset_params
    params.require(:project_asset).permit(:photo)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
