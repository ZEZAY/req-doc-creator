class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.friendly.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def create
    @project = Project.create(project_params)
    if @project.invalid?
      flash[:error] = @project.errors.full_messages
    end
    redirect_to action: :index
  end

  def update
    @project = Project.friendly.find(params[:id])
    @project.update(project_params)
    if @project.invalid?
      flash[:error] = @project.errors.full_messages
    end
    redirect_to action: :index
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    @project.destroy
    redirect_to action: :index
  end

  private

  def project_params
    params.require(:project).permit(:status, :name)
  end
end
