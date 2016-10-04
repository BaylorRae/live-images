class ImagesController < ApplicationController
  http_basic_authenticate_with name: "baylor is the greatest", password: "baylor is so awesome", only: :create

  def index
    @images = current_project.images
  end

  def latest
    @image = Image.latest
  end

  def create
    current_project.images.create!(image_params)
  end

  private

  def current_project
    @current_project ||= Project.find(params[:project_id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
