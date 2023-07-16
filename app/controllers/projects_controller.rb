class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def show
    @project = Project.all
  end
end