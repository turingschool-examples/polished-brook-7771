class ProjectsController < ApplicationController
def show 
@projects = Project.find(params[:id])
@contestants = @projects.contestants
end

def update
  @projects = Projects.find(params[:id])
  @projects.update(contestants)
  redirect_to "/projects/#{@projects.id}"
end


end