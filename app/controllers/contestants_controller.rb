class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.all.includes(:projects)
  end
end