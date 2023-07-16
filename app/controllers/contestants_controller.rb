class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @contestants_projects = ContestantProject.includes(:project).where(contestant_id: @contestants.pluck(:id))
  end

  def show
    @contestant = Contestant.find(params[:id])
    @contestants_projects = @contestant.projects
  end

  private

  def contestant_params
    params.permit(:name, :age, :hometown, :years_of_experience)
  end
end
