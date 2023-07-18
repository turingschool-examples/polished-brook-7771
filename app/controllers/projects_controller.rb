class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end
end


private

def project_params
    params.permit(:name, :material)
end