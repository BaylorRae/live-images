class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "baylor is the greatest", password: "baylor is so awesome", except: :index

  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
