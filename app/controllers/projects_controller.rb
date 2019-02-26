class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  def index
    @projects = Project.all
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

  # def reviews
  #   reviews = []
  #   self.bookings.each do |booking|

  #     reviews << booking.review if booking.review
  #   end
  #   return reviews
  # end

  # def rating
  #   reviews.map { |review| review.rating }.sum / reviews.count.to_f
  # end
