class ContestantProjectsController < ApplicationController
  def create
    project = Project.find(params[:id])
    contestant = Contestant.find(params[:add_contestant])
    contestant_project = ContestantProject.create!(
      project_id: project.id,
      contestant_id: contestant.id
    )
    redirect_to "/projects/#{project.id}"
  end
end