class ProjectsController < ApplicationController
def show 
@projects = Project.find(params[:id])
@contestants = @projects.contestants
end


end