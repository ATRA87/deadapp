class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
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
