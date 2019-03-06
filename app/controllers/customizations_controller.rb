class CustomizationsController < ApplicationController
  before_action :set_project, only: %i[new create]

  def new
    @customization = Customization.new
    @customization.project = @project
    authorize @customization
  end

  def create
    @customization = Customization.new(customization_params)
    @customization.project = @project
    authorize @customization
    return redirect_to @project if @customization.save

    render :new
  end

  def edit
  end

  def update
  end

  def destroy
    @customization = Customization.find(params[:project_id])
    @customization.destroy
  end

  private

  def customization_params
    params.require(:customization).permit(:description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
