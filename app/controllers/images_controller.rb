class ImagesController < ApplicationController
  http_basic_authenticate_with name: "image-uploader", password: "baylor-is-so-awesome", only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @images = current_project.images
  end

  def latest
    @image = Image.latest
  end

  def create
    render json: current_project.images.create!(image_params)
  end

  private

  def current_project
    @current_project ||= Project.find(params[:project_id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
