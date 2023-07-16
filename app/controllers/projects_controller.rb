class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.find_by_project(@project.id)
  end
end