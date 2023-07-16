class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    # @contestants.first.projects.pluck(:name)
  end
end