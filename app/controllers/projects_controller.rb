class ProjectsController < ApplicationController
  def show
    @project = Project.includes(:contestants).find{params[:id]}
    @challenge = @project.challenge
    @theme = @challenge.theme
  end
end