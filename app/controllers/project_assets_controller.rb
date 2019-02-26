class ProjectAssetsController < ApplicationController
  before_action :set_project, only: [:new, :create]
  def new
    @project_asset = ProjectAsset.new
  end

  def create
    @project_asset = ProjectAsset.new(project_asset_params)
    @project_asset.project = @project
    raise
    return redirect_to @project if @project_asset.save

    render :new
  end

  private

  def project_asset_params
    params.require(:project_asset).permit(:photo)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
