class ProjectsController < ApplicationController

    def show
        @project = Project.find(params[:id])
        @challenge = Project.find(params[:id]).challenge
    end
end