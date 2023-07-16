class ContestantsProjectsController < ApplicationController
  def index; end

  def show
    @contestant = Contestant.find(params[:id])
    @contestants_projects = @contestant.projects
  end
end
