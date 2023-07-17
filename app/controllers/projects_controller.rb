class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def add_contestant
    project = Project.find(params[:id])
    project.contestants << Contestant.find(params[:contestant_id])
    redirect_to "/project/#{project.id}"
  end
end
