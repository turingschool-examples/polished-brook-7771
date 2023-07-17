class ProjectsController < ApplicationController
  def show
    @project = Project.find{params[:id]}
    @challenge = @project.challenge
    @theme = @challenge.theme
  end
end